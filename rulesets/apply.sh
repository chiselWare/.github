#!/usr/bin/env bash
# Apply rulesets/release-tags.json to chiselWare cores (repos named xx-xxx-*).
# Creates the ruleset where missing and updates it where it already exists,
# so it is safe to re-run after editing the JSON.
# Usage: ./apply.sh              # all cores
#        ./apply.sh 01-002-uart  # one repo
set -euo pipefail
ORG=chiselWare
JSON="$(dirname "$0")/release-tags.json"
NAME=$(jq -r .name "$JSON")

repos=${1:-$(gh repo list "$ORG" --limit 500 --json name -q '.[].name' \
             | grep -E '^[A-Za-z0-9]{2}-[A-Za-z0-9]{3}-')}

for r in $repos; do
  id=$(gh api "repos/$ORG/$r/rulesets" \
         -q ".[] | select(.name == \"$NAME\") | .id" | head -1)
  if [ -n "$id" ]; then
    gh api -X PUT "repos/$ORG/$r/rulesets/$id" --input "$JSON" >/dev/null
    echo "updated: $r"
  else
    gh api -X POST "repos/$ORG/$r/rulesets" --input "$JSON" >/dev/null
    echo "applied: $r"
  fi
done

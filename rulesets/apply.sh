#!/usr/bin/env bash

# Apply rulesets/release-tags.json to chiselWare cores (repos named xx-xxx-*).
# Usage: ./apply.sh            # all cores
#        ./apply.sh 01-002-uart  # one repo

set -euo pipefail
ORG=chiselWare
JSON="$(dirname "$0")/release-tags.json"
NAME=$(jq -r .name "$JSON")

repos=${1:-$(gh repo list "$ORG" --limit 500 --json name -q '.[].name' \
             | grep -E '^[A-Za-z0-9]{2}-[A-Za-z0-9]{3}-')}

for r in $repos; do
  if gh api "repos/$ORG/$r/rulesets" -q '.[].name' | grep -qxF "$NAME"; then
    echo "exists:  $r"
  else
    gh api -X POST "repos/$ORG/$r/rulesets" --input "$JSON" >/dev/null
    echo "applied: $r"
  fi
done
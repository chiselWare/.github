# Ruleset release procedure

```bash
gh auth status          # logged in as you, with admin on the core repos
./rulesets/apply.sh     # all cores
./rulesets/apply.sh 01-002-uart   # just one new core
```
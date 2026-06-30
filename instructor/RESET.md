# Reset between cohorts

After an event you'll have 70+ `student/*` branches. Options:

## Option A — Keep it as a snapshot (recommended)
Do nothing, or archive the repo (Settings → Archive). It becomes read-only and stays as a record of what people built. Start the next cohort with a brand-new repo from the same starter (copy this folder, run `instructor/setup.sh` with a new name).

## Option B — Wipe the student branches, keep the repo
Delete every remote branch that starts with `student/`:

```bash
# DRY RUN — see what would be deleted
git ls-remote --heads origin 'refs/heads/student/*' | awk '{print $2}' | sed 's#refs/heads/##'

# DELETE them (irreversible)
git ls-remote --heads origin 'refs/heads/student/*' \
  | awk '{print $2}' | sed 's#refs/heads/##' \
  | while read -r b; do echo "deleting $b"; git push origin --delete "$b"; done
```

Then optionally remove collaborators:

```bash
REPO="andrewyu47/claude-dojo-playground"
gh api "repos/$REPO/collaborators" --paginate -q '.[].login' \
  | while read -r u; do gh api -X DELETE "repos/$REPO/collaborators/$u" && echo "removed $u"; done
```

(That removes everyone, including any co-instructors — re-add them after.)

## Option C — Fresh repo per cohort
Cleanest for recurring runs: keep this folder as the template, and each time run `instructor/setup.sh` pointed at a new name like `claude-dojo-playground-2026-09`. Old cohorts stay frozen, new one starts empty.

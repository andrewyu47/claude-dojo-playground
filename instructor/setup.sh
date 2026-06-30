#!/usr/bin/env bash
# One-time: create the GitHub repo, push main, and protect main so students
# can't push to it directly. Run from the repo root. Idempotent-ish.
# Requires: gh (authenticated as andrewyu47).
set -euo pipefail

REPO="andrewyu47/claude-dojo-playground"

if ! command -v gh >/dev/null 2>&1; then echo "Install GitHub CLI: https://cli.github.com"; exit 1; fi

# 1. Init + first commit if needed
if [ ! -d .git ]; then
  git init -b main
  git add -A
  git commit -m "Claude Dojo Playground starter"
fi

# 2. Create the repo on GitHub and push (skips creation if it already exists)
if ! gh repo view "$REPO" >/dev/null 2>&1; then
  gh repo create "$REPO" --public --source=. --remote=origin --push \
    --description "Sandbox for the Claude Dojo intensive. Make your own branch and folder."
else
  echo "Repo already exists; pushing main."
  git push -u origin main
fi

# 3. Protect main: require a PR to change it, so 70 collaborators can't push to main.
gh api -X PUT "repos/$REPO/branches/main/protection" \
  -H "Accept: application/vnd.github+json" \
  --input - <<'JSON' >/dev/null
{
  "required_status_checks": null,
  "enforce_admins": false,
  "required_pull_request_reviews": { "required_approving_review_count": 0 },
  "restrictions": null,
  "allow_force_pushes": false,
  "allow_deletions": false
}
JSON

echo "Done."
echo "Repo:     https://github.com/$REPO"
echo "Branches: https://github.com/$REPO/branches"
echo "Next: collect usernames into instructor/usernames.txt, then ./instructor/add-students.sh"

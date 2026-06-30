#!/usr/bin/env bash
# Claude Dojo Playground — one-step join (Mac/Linux/git-bash).
# Prefer the Claude Code prompt in START-HERE.md; this is the power-user path.
set -euo pipefail

read -rp "Pick a handle (lowercase letters, numbers, dashes): " RAW
HANDLE=$(printf '%s' "$RAW" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-*//;s/-*$//')
if [ -z "$HANDLE" ]; then echo "That handle came out empty. Try letters/numbers."; exit 1; fi

BRANCH="student/$HANDLE"
echo "Setting you up as '$HANDLE' on branch '$BRANCH'..."

git checkout main >/dev/null 2>&1 || true
git pull --ff-only >/dev/null 2>&1 || true

if git show-ref --verify --quiet "refs/heads/$BRANCH"; then
  git checkout "$BRANCH"
else
  git checkout -b "$BRANCH"
fi

mkdir -p "students/$HANDLE"
if [ ! -f "students/$HANDLE/about-me.md" ]; then
  cat > "students/$HANDLE/about-me.md" <<EOF
# $HANDLE

This is my corner of the Claude Dojo Playground.

- Who I am:
- What I want out of today:
- Something I'd love to build:
EOF
fi

git add "students/$HANDLE"
git commit -m "Add $HANDLE's playground" >/dev/null 2>&1 || echo "(nothing new to commit)"

if git push -u origin "$BRANCH"; then
  echo ""
  echo "Done. Your branch is live: https://github.com/andrewyu47/claude-dojo-playground/tree/$BRANCH"
  echo "Build inside students/$HANDLE/ and run ./save.sh (or 'git add students/$HANDLE && git commit -m ... && git push') to save."
else
  echo ""
  echo "Push failed. The usual cause: you haven't accepted the repo invite yet."
  echo "Accept it at https://github.com/andrewyu47/claude-dojo-playground/invitations and run this again."
fi

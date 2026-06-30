#!/usr/bin/env bash
# Save (commit + push) the current student's folder.
set -euo pipefail

BRANCH=$(git rev-parse --abbrev-ref HEAD)
case "$BRANCH" in
  student/*) HANDLE="${BRANCH#student/}";;
  *) echo "You're on '$BRANCH', not a student branch. Run ./join.sh first."; exit 1;;
esac

MSG="${1:-playing around}"
git add "students/$HANDLE"
git commit -m "$MSG" >/dev/null 2>&1 || { echo "Nothing new to save."; exit 0; }
git push
echo "Saved and pushed students/$HANDLE/ on $BRANCH."

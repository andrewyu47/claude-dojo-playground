#!/usr/bin/env bash
# Bulk-add students as collaborators (push access) from a list of GitHub usernames.
# Usage: ./instructor/add-students.sh instructor/usernames.txt
# Requires: gh (authenticated as the repo owner).
set -euo pipefail

REPO="andrewyu47/claude-dojo-playground"
LIST="${1:-instructor/usernames.txt}"

if ! command -v gh >/dev/null 2>&1; then echo "Install GitHub CLI: https://cli.github.com"; exit 1; fi
if [ ! -f "$LIST" ]; then echo "No username list at '$LIST'. Make one, one username per line."; exit 1; fi

added=0; skipped=0; failed=0
while IFS= read -r raw || [ -n "$raw" ]; do
  u=$(printf '%s' "$raw" | tr -d '[:space:]')
  u="${u#@}"                          # strip a leading @ if pasted
  [ -z "$u" ] && continue
  case "$u" in \#*) continue;; esac    # allow # comments
  if gh api -X PUT "repos/$REPO/collaborators/$u" -f permission=push >/dev/null 2>&1; then
    echo "invited: $u"; added=$((added+1))
  else
    echo "FAILED:  $u  (bad username? already a collaborator?)"; failed=$((failed+1))
  fi
done < "$LIST"

echo ""
echo "Done. invited=$added failed=$failed"
echo "Remind everyone to ACCEPT the invite: https://github.com/$REPO/invitations"

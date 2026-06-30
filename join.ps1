# Claude Dojo Playground - one-step join (Windows PowerShell).
# Prefer the Claude Code prompt in START-HERE.md; this is the power-user path.
$ErrorActionPreference = "Stop"

$raw = Read-Host "Pick a handle (lowercase letters, numbers, dashes)"
$handle = ($raw.ToLower() -replace '[^a-z0-9]+','-').Trim('-')
if ([string]::IsNullOrEmpty($handle)) { Write-Host "That handle came out empty. Try letters/numbers."; exit 1 }

$branch = "student/$handle"
Write-Host "Setting you up as '$handle' on branch '$branch'..."

git checkout main 2>$null
git pull --ff-only 2>$null

$exists = git show-ref --verify --quiet "refs/heads/$branch"; $ok = $?
if ($ok) { git checkout $branch } else { git checkout -b $branch }

New-Item -ItemType Directory -Force -Path "students/$handle" | Out-Null
$about = "students/$handle/about-me.md"
if (-not (Test-Path $about)) {
@"
# $handle

This is my corner of the Claude Dojo Playground.

- Who I am:
- What I want out of today:
- Something I'd love to build:
"@ | Set-Content -Encoding utf8 $about
}

git add "students/$handle"
git commit -m "Add $handle's playground" 2>$null

git push -u origin $branch
if ($LASTEXITCODE -eq 0) {
  Write-Host ""
  Write-Host "Done. Your branch is live: https://github.com/andrewyu47/claude-dojo-playground/tree/$branch"
} else {
  Write-Host ""
  Write-Host "Push failed. Usual cause: you haven't accepted the repo invite yet."
  Write-Host "Accept it at https://github.com/andrewyu47/claude-dojo-playground/invitations and run this again."
}

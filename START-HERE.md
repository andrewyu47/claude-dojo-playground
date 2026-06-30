# Start here

Five minutes to your own corner of the playground. You do not need to know git. Claude Code does the git for you.

## Before you start, you need three things

1. **Claude Code installed and logged in.** You did this in White Belt. If `claude --version` shows a number, you're good.
2. **A GitHub account.** Free at [github.com](https://github.com). Tell an instructor your username.
3. **An accepted invite.** The instructors add you to this repo so you can push. GitHub emails you an invite, or visit [github.com/andrewyu47/claude-dojo-playground/invitations](https://github.com/andrewyu47/claude-dojo-playground/invitations) and click **Accept**. Without this, your push will be denied. This is the one step people forget.

## Step 1 — Clone the playground

In your terminal (inside Cursor is fine):

```bash
cd ~/Desktop
git clone https://github.com/andrewyu47/claude-dojo-playground.git
cd claude-dojo-playground
```

Now open this folder in Claude Code (`claude` in that folder, or open the folder in Cursor and start Claude Code there).

## Step 2 — Let Claude Code set you up

Pick a **handle**: lowercase letters, numbers, and dashes only (e.g. `jordan`, `priya-k`, `alex2`). Paste this into Claude Code and fill in your handle:

```
I just cloned the claude-dojo-playground repo and I'm a student in the
Claude Dojo. Read CLAUDE.md first, then set me up:

1. Make sure I'm on the latest main, then create my branch student/<HANDLE>.
2. Create my folder students/<HANDLE>/ with a short about-me.md that
   introduces me (ask me a couple of quick questions first).
3. Commit it and push my branch to GitHub.
4. Then tell me, in plain language, how to save and push new work as I go.

My handle is: <HANDLE>
```

That's it. You now have your own branch and folder online. Refresh the repo on GitHub and switch to your branch to see it.

## Step 3 — Play

Build anything in `students/<your-handle>/`. Some ideas, all from the belt curriculum:

- Drop a CSV in your folder and ask Claude Code to analyze it (try `starter-kit/sample-data.csv`).
- Tailor the fake resume in `starter-kit/` to the fake job posting next to it.
- Have Claude Code build you an HTML page (a portfolio, a dashboard) and open it in your browser.
- Write a `CLAUDE.md` about yourself inside your folder and watch answers get more personal.

## Step 4 — Save your work (push)

Whenever you make something you like, just tell Claude Code:

```
Save my work: commit everything in my folder and push my branch.
```

Or, if you'd rather type the commands yourself:

```bash
git add students/<your-handle>
git commit -m "playing around"
git push
```

## If something goes wrong

| Problem | Fix |
|---|---|
| `push` says **permission denied** / 403 | You haven't accepted the repo invite yet. See step 3 of prerequisites. |
| `push` is **rejected (non-fast-forward)** | You're somehow on a branch someone else used. Ask Claude Code: "make me a fresh branch student/<handle>-2 and move my folder there." |
| You edited `main` or someone else's folder by accident | Ask Claude Code: "undo my changes outside students/<my-handle>/ and get me back on my own branch." You can't actually hurt `main`, it's protected. |
| Totally stuck | Raise your hand. An instructor or a floating helper will unblock you in a minute. |

You cannot break anything that matters. Your branch is yours. Go make something.

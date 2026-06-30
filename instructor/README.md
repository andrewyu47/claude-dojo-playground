# Instructor guide

Everything you need to run the playground for ~70 people.

## The access reality (read this first)

Students push their own branch (`student/<handle>`), which means each one needs **write access** to this repo. There is no way around GitHub auth here. You have three ways to grant it, easiest first:

1. **Bulk-add collaborators (what these scripts do).** Collect GitHub usernames, run `add-students.sh`. Each student gets an invite they must **accept** (the #1 forgotten step). Good up to ~100 people on a personal repo.
2. **GitHub Organization + one team with write access.** Put this repo in an org, add all students to a single team. Cleaner for recurring cohorts. Still requires each to accept the org invite.
3. **GitHub Classroom.** Purpose-built for classrooms; auto-handles access. Heavier setup, and it nudges you toward per-student repos rather than one shared repo. Use it if you run this often.

These scripts assume option 1.

## Before the event

1. **Create the repo and protect `main`** (already done if Andrew ran `setup.sh`):
   ```bash
   ./instructor/setup.sh
   ```
   This creates `andrewyu47/claude-dojo-playground`, pushes `main`, and protects `main` so students can't push to it directly (they push their own branch instead).

2. **Collect GitHub usernames.** Easiest: a Google Form ("your GitHub username") sent with the pre-work. Paste the results, one per line, into `instructor/usernames.txt`.

3. **Add everyone:**
   ```bash
   ./instructor/add-students.sh instructor/usernames.txt
   ```
   Re-run any time as late sign-ups trickle in; it skips people already added.

4. **Tell students to accept the invite.** Email link, or https://github.com/andrewyu47/claude-dojo-playground/invitations . Put this on a slide. Half your support questions on the day will be "my push is denied" = invite not accepted.

## During the event

- Students follow `START-HERE.md`: clone, paste the Claude Code setup prompt, build in their folder, push.
- Floating helpers: the two failure modes are (a) invite not accepted (403 on push) and (b) someone reused a handle (non-fast-forward push) — fix by making a fresh `student/<handle>-2` branch.
- Watch the branch list fill up: https://github.com/andrewyu47/claude-dojo-playground/branches — it's a fun live "look what everyone's making" wall.

## After the event

See `RESET.md` to wipe student branches and start clean for the next cohort, or to archive the repo as a snapshot.

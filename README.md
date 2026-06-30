# Claude Dojo Playground

A shared sandbox for the Claude Dojo intensive. Clone it, make your own branch, and build whatever you want inside your own folder. Around 70 people use this repo at once, so the rules below keep everyone out of each other's way.

## The one big idea

**Everyone works on their own branch and in their own folder.** Nobody pushes to `main`. Because each person pushes only their own `student/<your-handle>` branch, nobody's push ever collides with anyone else's. You get your own corner of the repo that is yours to break, rebuild, and show off.

```
main                     <- read-only starter content (instructors only)
student/jordan           <- Jordan's branch  -> students/jordan/
student/priya            <- Priya's branch    -> students/priya/
student/alex             <- Alex's branch      -> students/alex/
...70+ branches, zero collisions
```

## Golden rules

1. **Stay on your branch.** `student/<your-handle>`. Never push to `main`.
2. **Stay in your folder.** `students/<your-handle>/`. Don't edit anyone else's folder or the starter content.
3. **Push often.** Pushing is just "save to the cloud." Do it whenever you make something you like.
4. **You cannot break anything.** Worst case, you delete your branch and start over. The starter content on `main` is protected.

## Quick start

New here? Open **[START-HERE.md](START-HERE.md)** and follow it. The short version:

1. Clone this repo.
2. Open it in Claude Code and paste the setup prompt from START-HERE.
3. Build things in `students/<your-handle>/`.
4. Push whenever you want to save.

## What's in here

| Folder | What it's for |
|---|---|
| `students/` | One folder per person. Yours goes here. `EXAMPLE-jordan/` shows the shape. |
| `starter-kit/` | Sample data, prompts, and a fake resume + job posting to play with. Read-only, copy what you want into your folder. |
| `instructor/` | Scripts and notes for the people running the event (adding students, resetting after). |
| `CLAUDE.md` | Context Claude Code reads automatically so it knows the playground rules. |

Have fun. Make a mess in your own corner.


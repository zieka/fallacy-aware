---
name: fallacy-aware:review
description: Use when reviewing a pull request, diff, commit, design doc, RFC, or review thread, or when writing or answering review comments
---

## Review

**Core Error:** Approving a change, or posting a comment, without checking the reasoning behind it.

## How to Use

1. Read the diff, the PR description, and the thread.
2. For each diff or PR row whose signal appears and that the PR or its history doesn't fully answer, post one question citing the line, commit, or claim. Prefix it `Blocking:` for **gate** rows (don't approve until it's answered) or `Non-blocking:` for the rest.
3. For each thread row whose signal appears, write the reply its Do column describes. As a reviewer, prefix it `Non-blocking:`; as the author, use no prefix.
4. For depth on a hit, load `fallacy-aware:<skill>` and follow its `## In review` section.
5. Check your own comments against the thread rows before posting.
6. No hits? Say so in one line. Don't invent findings.

## The Diff

| Signal | Ask the author | Skill |
|---|---|---|
| Deletes code, config, a test, a flag, or a dependency with no stated reason | Why did this exist, and what covers that case now? | `chestertons-fence` (gate) |
| Changes observable behavior: error text or codes, defaults, output shape or order, timing | Who depends on the old behavior, and how will they find out? | `hyrums-law` (gate) |
| Replaces a working module in one step | Can this land in steps that each work, with the old path running until the new one matches it? | `galls-law` (gate) |
| A replacement adds scope the original never had | Which of these additions does the first release need? | `second-system-effect` (gate) |
| Adds a pattern, tool, or framework without naming the problem it solves | What problem in our code does this solve, and do we meet what it needs to work? | `cargo-culting` (gate) |
| Another workaround on an approach that keeps failing | Starting today, would we choose this approach? | `sunk-cost` (gate) |
| Wraps a leaking abstraction in another layer | What does the layer below do here? | `leaky-abstractions` |
| Module boundaries follow team lines, not the domain | Would the domain split here if one team owned both sides? | `conways-law` |
| Moves a metric (coverage, lint count, benchmark) without the goal behind it | Does the goal improve, or only the number? | `goodharts-law` |

## The PR Description and Its Claims

| Signal | Ask the author | Skill |
|---|---|---|
| Weighs only two options | What other options did we rule out, including doing nothing or a smaller step? | `false-dichotomy` (gate) |
| "Fixed" after one green run, or a conclusion from one or two cases | How many runs or cases back this? | `hasty-generalization` |
| "A changed, then B broke, so A caused B" | What's the mechanism, and what else changed then? | `post-hoc` |
| "No errors or complaints, so it's safe" | Would we see errors if it failed? | `argument-from-silence` |
| A streak used as evidence: "it always passes" or "it's due to pass" | What changed between runs? | `gamblers-fallacy` |
| Chosen mainly because it's new | What does it do better than what we have, and what do we give up? | `appeal-to-novelty` |
| "We've always done it this way" | What's the technical reason today? | `appeal-to-tradition` |
| "An expert or a big company does it" as the only reason | Does it hold for our case? | `argument-from-authority` |
| An elaborate cause where a simple one fits | Have we ruled out the simpler cause? | `occams-razor` |

## The Thread

| Signal | Do | Skill |
|---|---|---|
| Restates a proposal in an extreme form ("so you want to…") | Restate what was proposed, then answer that | `straw-man` |
| Dismisses input by who gave it | Judge the argument on its merits | `ad-hominem` |
| Answers criticism with "you do it too" | Address the criticism itself | `tu-quoque` |
| Redefines a term to exclude a counterexample | Update the claim, not the definition | `no-true-scotsman` |
| "This will lead to X, then Y, then disaster" | Ask for evidence for each step, or argue from this change alone | `slippery-slope` |
| Attributes a choice to carelessness or bad intent | Ask what constraints the author had | `hanlons-razor` |

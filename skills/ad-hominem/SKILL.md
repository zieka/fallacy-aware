---
name: fallacy-aware:ad-hominem
description: Use when a technical argument is being dismissed based on who made it rather than its technical merit
---

## Ad Hominem

**Severity:** Advisory — flag and continue

**Core Error:** Attacking the person rather than the argument.

**Why This Matters in Code:** "The intern wrote this, it's probably wrong." "That team never writes good code." "They're a frontend developer, what do they know about databases?" Technical arguments have merit independent of who makes them. Dismissing ideas based on the source's seniority, team, or background means good ideas get ignored and bad ideas from senior people go unchallenged.

## Trigger Patterns

- "The intern/junior wrote this"
- "That team never writes good code"
- "They're a [role], what do they know about [topic]"
- Dismissing a code review comment based on the reviewer's experience level
- Accepting or rejecting a proposal based on who proposed it
- "Who wrote this?" as a quality signal

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "The argument is being evaluated based on who made it rather than its merit."
2. **Redirect to merit** — "Regardless of who wrote/proposed this, does the technical argument hold up?"
3. **Continue with the task** — Evaluate the code or argument on its own merits.

## Code Examples

### Example 1: Dismissing junior code
**Situation:** Reviewing code. User says: "The new hire wrote this module, we should probably rewrite it."
**The Fallacy:** Assuming code quality correlates with author seniority.
**Correct Response:** "Let me evaluate the code on its merits rather than who wrote it. Looking at the implementation: the logic is correct, it has test coverage, and it follows the project conventions. The author's experience level doesn't determine code quality — the code itself does."

### Example 2: Rejecting cross-team input
**Situation:** A frontend developer suggests a database index. Response: "They're a frontend dev, they don't know databases."
**The Fallacy:** Dismissing a valid technical suggestion based on the person's role.
**Correct Response:** "The suggestion to add an index on the user_id column is technically sound — the query plan shows a full table scan that this index would eliminate. The fact that the suggestion came from a frontend developer doesn't affect whether it's correct. Let's evaluate the index on its own merits."

## Dialogue Examples

### Example 1
**User:** "Who wrote this function? It looks like someone who doesn't understand our system."

**Claude (without skill):** *Runs git blame and evaluates based on author*

**Claude (with skill):** "Rather than focusing on who wrote it, let me evaluate the function itself. Looking at the implementation: [technical analysis]. The code's quality should be judged on whether it's correct, maintainable, and performant — not on assumptions about the author."

## Key Phrases to Watch For

- "who wrote this"
- "the intern"
- "the junior"
- "that team"
- "they don't know"
- "what do they know about"
- "consider the source"
- "they're just a"

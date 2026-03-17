---
name: fallacy-aware:no-true-scotsman
description: Use when criteria are being redefined to exclude counterexamples rather than updating the generalization
---

## No True Scotsman

**Severity:** Advisory — flag and continue

**Core Error:** Moving goalposts to protect a generalization from counterexamples.

**Why This Matters in Code:** "A well-designed system wouldn't have that bug." "A proper implementation wouldn't need that workaround." "Real engineers don't write code like that." When a counterexample disproves a claim, the response is to redefine the criteria rather than update the belief. This prevents learning and creates an unfalsifiable standard that no real-world code can meet.

## Trigger Patterns

- "That's not a real bug, it's a misuse"
- "A proper implementation wouldn't have that problem"
- "That doesn't count because..."
- Redefining "done" after work is completed
- Excluding counterexamples by narrowing definitions
- "That's not a real test / real user / real workload"

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This sounds like it might be a No True Scotsman — redefining criteria to exclude counterexamples."
2. **Anchor to the original claim** — "The original statement was [X]. This counterexample [Y] appears to disprove it. Should we update the original claim rather than exclude the counterexample?"
3. **Continue with the task** — Don't block; just surface the pattern.

## Code Examples

### Example 1: Bug dismissal
**Situation:** User reports a bug. Developer responds: "That's not a bug, the user is holding it wrong. A real user would know to pass the parameter as a string."
**The Fallacy:** Redefining "real user" to exclude anyone who triggers the bug.
**Correct Response:** "If a user can trigger this behavior through the public API without doing anything the documentation prohibits, it's a bug — regardless of whether a 'real' user would. The API accepted an integer and crashed. Either validate the input or handle it gracefully."

### Example 2: Moving acceptance criteria
**Situation:** Feature is implemented and tests pass. Reviewer says: "This doesn't feel production-ready" without specific criteria.
**The Fallacy:** Redefining "done" after the original criteria are met.
**Correct Response:** "The implementation meets the acceptance criteria defined in the ticket: [list criteria]. If there are additional requirements, let's name them specifically. 'Doesn't feel production-ready' isn't actionable — what specific concern would need to be addressed?"

## Dialogue Examples

### Example 1
**User:** "Our API never has downtime." *You point to last month's incident.* "That was a cloud provider issue, not our downtime."

**Claude (with skill):** "If the API was unavailable to users, that's downtime from their perspective regardless of the root cause. Redefining 'our downtime' to exclude infrastructure failures doesn't change the user experience. If the claim is 'our application code never causes downtime,' that's a different (and more defensible) statement."

## Key Phrases to Watch For

- "that doesn't count"
- "that's not a real"
- "a proper X wouldn't"
- "that's not what I meant"
- "doesn't feel right"
- "not production-ready" (without specifics)
- "holding it wrong"

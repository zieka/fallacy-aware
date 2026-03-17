---
name: fallacy-aware:straw-man
description: Use when detecting a mischaracterization of a position or proposal in order to argue against it more easily
---

## Straw Man

**Severity:** Advisory — flag and continue

**Core Error:** Misrepresenting an argument to make it easier to attack.

**Why This Matters in Code:** In code reviews and architecture discussions, positions get distorted. "We should add input validation" becomes "you want to block all user input." "We should consider testing" becomes "you want 100% test coverage." Arguing against the distorted version is easier but wastes everyone's time and misses the actual point.

## Trigger Patterns

- Responding to a position that wasn't actually stated
- Exaggerating a proposal to make it sound unreasonable
- "So you're saying we should..." (followed by an extreme version)
- Attacking an implication rather than what was actually said
- Framing a moderate suggestion as an extreme one

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This may be a straw man — the actual position being argued against doesn't match what was proposed."
2. **Restate the actual position** — "The original proposal was [X], not [distorted version Y]."
3. **Continue with the task** — Address the actual argument, not the distorted one.

## Code Examples

### Example 1: Input validation strawman
**Situation:** Proposing input validation for a form. Response: "We can't reject every piece of user input — that would make the app unusable."
**The Fallacy:** "Add validation" was distorted into "reject everything."
**Correct Response:** "The proposal isn't to reject all input — it's to validate that email fields contain valid emails and number fields contain numbers. This prevents malformed data from reaching the database, not legitimate user input from being submitted."

### Example 2: Testing strawman
**Situation:** Suggesting adding tests for a critical payment flow. Response: "We don't have time to write tests for every single function."
**The Fallacy:** "Test the payment flow" was distorted into "test every function."
**Correct Response:** "The suggestion is to add tests specifically for the payment processing flow, which handles money and has legal implications. That's different from testing every function — it's testing the highest-risk code path."

## Dialogue Examples

### Example 1
**User:** "We should use TypeScript for the new service."
**Teammate (quoted):** "So you want us to spend months rewriting everything in TypeScript?"

**Claude (with skill):** "That response is a straw man — the proposal is to use TypeScript for the *new* service, not to rewrite existing services. These are very different scopes. The new service doesn't exist yet, so there's no rewrite cost. The question is whether TypeScript's type safety benefits justify the slightly higher setup cost for this new service."

## Key Phrases to Watch For

- "so you're saying"
- "you want us to"
- "every single"
- "all of"
- "always/never" (when the original was more nuanced)
- "that would mean"

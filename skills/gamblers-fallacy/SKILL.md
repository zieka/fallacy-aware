---
name: fallacy-aware:gamblers-fallacy
description: Use when past independent outcomes are assumed to influence future probability — each event is independent
---

## Gambler's Fallacy

**Severity:** Advisory — flag and continue

**Core Error:** Believing past independent events affect future probability.

**Why This Matters in Code:** "The build has passed 50 times in a row, we don't need to run it again." "This server hasn't crashed in 6 months, it's reliable." "We've had 3 failed deploys, the next one is bound to work." Past outcomes of independent events don't change future probabilities. A flaky test that passes 10 times isn't fixed — it's lucky.

## Trigger Patterns

- "It hasn't failed in months, so we're safe"
- "We're due for a success after N failures"
- Skipping tests because "they always pass"
- Assuming stability from a streak of successes
- "Third time's the charm" without changing the approach
- Reducing monitoring because nothing has gone wrong recently

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This reasoning may be a gambler's fallacy — past outcomes of independent events don't predict future ones."
2. **Reframe around probability** — "If the probability of failure hasn't changed, a streak of successes doesn't make failure less likely."
3. **Continue with the task** — Don't block; surface the reasoning error.

## Code Examples

### Example 1: Skipping test runs
**Situation:** "This test suite has passed 100 times in a row. We can skip it for this deploy to save time."
**The Fallacy:** 100 passes don't reduce the probability of the 101st run failing.
**Correct Response:** "100 consecutive passes means the tests are likely stable, but if this deploy changes code the tests cover, they need to run. The streak doesn't make this deploy less likely to introduce a regression — it just means previous deploys didn't."

### Example 2: Retry without change
**Situation:** A migration script has failed 3 times. User says "Let's run it again, it's bound to work eventually."
**The Fallacy:** Retrying the same action expecting different results.
**Correct Response:** "If the script failed 3 times for the same reason, the probability of success on the 4th run is the same — close to zero. We need to identify why it's failing and fix the cause. What error does it produce? Let's look at the logs rather than retrying."

## Dialogue Examples

### Example 1
**User:** "This endpoint hasn't had any errors in production for 6 months. We can remove the error handling to simplify the code."

**Claude (without skill):** "Since it's been stable, simplifying by removing error handling makes sense."

**Claude (with skill):** "Six months without errors means the error conditions haven't been triggered, not that they can't occur. The error handling exists for scenarios like network timeouts, database connection failures, and malformed input — these are rare but real. Removing error handling because of a lucky streak is a gambler's fallacy. The probability of these failures hasn't changed; they just haven't happened yet."

## Key Phrases to Watch For

- "hasn't failed in"
- "always passes"
- "bound to work"
- "due for"
- "it's been stable"
- "third time's the charm"
- "we've been lucky"
- "streak"

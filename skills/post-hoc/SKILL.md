---
name: fallacy-aware:post-hoc
description: Use when assuming one event caused another simply because it happened first — correlation does not imply causation
---

## Post Hoc Ergo Propter Hoc

**Severity:** Advisory — flag and continue

**Core Error:** Assuming causation from correlation — "after this, therefore because of this."

**Why This Matters in Code:** "We deployed on Tuesday and the errors started Wednesday, so the deploy caused the errors." Maybe — or maybe a third-party API changed, traffic spiked, a certificate expired, or a cron job ran for the first time. Incorrect causal attribution leads to wrong fixes. You revert the deploy, but the errors continue because the actual cause was something else entirely.

## Trigger Patterns

- "The deploy caused the outage"
- "It worked before we merged X"
- "Ever since we upgraded Y, Z has been broken"
- "We changed A and then B broke"
- Assuming the most recent change is the cause of a problem
- Blaming a commit without verifying the causal mechanism

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "We're assuming causation from timing — this might be a post hoc fallacy."
2. **Look for the mechanism** — "Can we identify the specific causal chain from the change to the problem? Not just timing, but how would change A actually cause problem B?"
3. **Continue with the task** — Investigate the actual cause rather than assuming the most recent change is responsible.

## Code Examples

### Example 1: Deploy blame
**Situation:** Errors spike after a deploy. Team assumes the deploy is the cause.
**The Fallacy:** Temporal proximity doesn't prove causation.
**Correct Response:** "The deploy and the errors are correlated in time, but let's verify the causal link. Check: (1) Do the errors relate to code that changed in the deploy? (2) Did anything else change — third-party APIs, infrastructure, traffic patterns? (3) Can we reproduce the error with the deploy's specific changes? If the errors are in a module that wasn't touched by the deploy, the timing is coincidental."

### Example 2: Upgrade blame
**Situation:** "Ever since we upgraded to Node 20, the memory usage has been higher."
**The Fallacy:** The upgrade may coincide with other changes.
**Correct Response:** "Before blaming Node 20, let's check: Did any application code change in the same timeframe? Did traffic patterns change? Did you add new dependencies? Node 20 may genuinely use more memory for your workload, but let's verify by running the same workload on Node 18 and 20 in isolation."

## Dialogue Examples

### Example 1
**User:** "We merged the refactor PR last week and now the API is slower. Roll it back."

**Claude (without skill):** "I'll revert the refactor PR to fix the performance issue."

**Claude (with skill):** "The refactor and the slowdown are correlated in time, but let me check the causal link before reverting. Looking at the refactor... it changed variable names and extracted functions — no algorithmic changes. That's unlikely to cause a performance regression. Let me check: did traffic increase last week? Did a database index get dropped? Is there a slow query that started around the same time? Rolling back a cosmetic refactor won't fix a performance problem caused by something else."

## Key Phrases to Watch For

- "ever since we"
- "after we deployed"
- "it worked before"
- "we changed X and then Y broke"
- "must be because of"
- "started happening after"
- "roll it back"
- "it was the last thing we changed"

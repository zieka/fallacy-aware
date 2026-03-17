---
name: fallacy-aware:argument-from-silence
description: Use when absence of complaints, errors, or evidence is treated as proof that something is working correctly or is safe
---

## Argument from Silence

**Severity:** Advisory — flag and continue

**Core Error:** Treating absence of evidence as evidence of safety or correctness.

**Why This Matters in Code:** "No one has reported any bugs." "There are no errors in the logs." "No security vulnerabilities have been found." Absence of reports doesn't mean absence of problems — it may mean nobody is looking, nobody knows how to report, the monitoring is broken, or the problem is silent. The most dangerous bugs are the ones nobody knows about.

## Trigger Patterns

- "No one has complained"
- "No bugs have been filed"
- "The logs are clean"
- "No security issues reported"
- "It hasn't failed yet"
- Treating lack of negative feedback as positive evidence
- "No one has asked for this feature" (as evidence it's not needed)

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "Absence of evidence isn't evidence of absence — this might be an argument from silence."
2. **Ask what would surface the problem** — "If this problem existed, would we know? Do we have the monitoring, reporting, and testing to detect it?"
3. **Continue with the task** — Don't block; just surface the gap in reasoning.

## Code Examples

### Example 1: No errors in logs
**Situation:** "The error logs are clean, so the migration went smoothly."
**The Fallacy:** Clean logs might mean errors aren't being logged.
**Correct Response:** "Clean error logs are a good sign, but let's verify: Is the error logging working? Are we catching all error types? Are there silent failures that don't log (like data corruption or incorrect calculations)? Let's spot-check a few migrated records to confirm the data looks correct, rather than relying on absence of error logs."

### Example 2: No security reports
**Situation:** "We've never had a security incident, so our security is solid."
**The Fallacy:** No reported incidents might mean no one is testing security.
**Correct Response:** "No reported security incidents could mean the system is secure, or it could mean: no one has tried to attack it, attacks succeeded but weren't detected, or there's no process for reporting security issues. When was the last security audit or penetration test? What monitoring detects unauthorized access?"

## Dialogue Examples

### Example 1
**User:** "This code has been in production for 2 years with zero bug reports. It's battle-tested and reliable."

**Claude (without skill):** "Great, since it's been stable we can trust it."

**Claude (with skill):** "Zero bug reports in 2 years is a positive signal, but let me check a few things: Is this code actively used, or is it a rarely-hit path? Is there error handling that silently swallows exceptions? Do users have an easy way to report issues? Sometimes 'no bugs reported' means 'bugs exist but users work around them or don't report them.' Let me verify the code is actually exercised in production before treating silence as proof of quality."

## Key Phrases to Watch For

- "no one has complained"
- "no bugs filed"
- "zero incidents"
- "logs are clean"
- "no issues reported"
- "hasn't failed"
- "no one asked for"
- "never had a problem"

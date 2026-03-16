---
name: fallacy-aware:sunk-cost
description: Use when continuing a failing approach, broken implementation, or problematic dependency because of time already invested — past investment should not drive future decisions
---

## Sunk Cost Fallacy

**Severity:** Gate — STOP and reassess before proceeding

**Core Error:** Continuing a failing path because of what's already been invested.

**Why This Matters in Code:** In software, this manifests as patching broken approaches, adding workarounds to bad libraries, refusing to revert because "we already spent a week on this," or escalating commitment to an approach that clearly isn't working. The time already spent is gone regardless — the only question is whether more time will make it work.

## Trigger Patterns

- Adding workarounds to a struggling approach
- "We've already invested X hours/days/weeks in this"
- Refusing to consider alternatives mid-implementation
- Escalating commitment to a failing dependency or library
- Patching around fundamental design flaws instead of reconsidering
- "We're almost there" after multiple failed attempts
- "It's too late to change course now"
- Continuing to debug an approach rather than trying a simpler alternative

## When This Activates

Before adding another workaround or continuing down a failing path, you MUST:

1. **Assess objectively** — Is the current approach working, or is it being propped up with workarounds?
2. **Count the patches** — How many workarounds, fixes, or special cases have been added to make this approach work?
3. **Apply the fresh-start test** — If starting today with everything we know now, would we choose this approach? If the answer is no, the sunk cost is driving the decision.
4. **Present the situation clearly:**
   - "Current approach: [description]"
   - "Investment so far: [time/effort]"
   - "Workarounds applied: [count and list]"
   - "Fresh-start test: Would we choose this approach today? [yes/no and why]"
   - "Alternative approaches: [list with honest comparison]"
   - "Recommendation: [continue/pivot/revert]"

## Code Examples

### Example 1: The workaround-laden library
**Situation:** Team has spent 3 days integrating a charting library. It doesn't quite support the needed features, so they've added 5 monkey-patches, 2 CSS hacks, and a custom wrapper.
**The Fallacy:** "We've already invested 3 days, we can't switch now."
**Correct Response:** "You've spent 3 days and created 7 workarounds for this library. The fresh-start test: knowing what we know now, would we pick this library? The answer appears to be no — it doesn't natively support the features you need. A different library that supports these features natively would likely take 1 day to integrate, with 0 workarounds to maintain. The 3 days are spent either way — the question is whether you want to keep maintaining 7 workarounds."

### Example 2: The flaky approach
**Situation:** Claude has been debugging a race condition in a concurrent approach for 20 minutes. Each fix reveals another timing issue.
**The Fallacy:** "I've been working on this, I should keep going."
**Correct Response:** "I've spent 20 minutes patching race conditions in this concurrent approach, and each fix exposes a new timing issue. Fresh-start test: the concurrency here may be unnecessary — a sequential approach would eliminate all race conditions and be simpler to maintain. The 20 minutes are spent either way. Recommend: try the sequential approach, which should take 5 minutes and won't have race conditions."

### Example 3: The half-finished migration
**Situation:** A database migration is 60% complete but the new schema is proving problematic. Reverting would "waste" the work done.
**The Fallacy:** "We can't revert, we've already migrated 60% of the tables."
**Correct Response:** "60% of tables are migrated to the new schema, but the remaining 40% expose fundamental issues with the new design (the many-to-many relationships don't map cleanly). Continuing means forcing the remaining tables into a schema that doesn't fit. Reverting preserves the option to design a schema that works for all tables. The 60% migration effort is spent either way — the question is whether to force-fit the remaining 40% or redesign with complete knowledge."

## Dialogue Examples

### Example 1
**User:** "This approach isn't working perfectly but we've already put two days into it. Let's just add one more workaround and ship it."

**Claude (without skill):** "Sure, let me add a workaround for this edge case." *adds another patch*

**Claude (with skill):** "Let me step back and look at this objectively. We've added 4 workarounds in 2 days. Each one fixed one issue but introduced friction elsewhere. Fresh-start test: if we were starting today, would we choose this approach? Looking at the alternatives, a [simpler approach] would handle this naturally without workarounds. The 2 days are spent either way — but shipping with 4+ workarounds means ongoing maintenance cost. Recommend: spend 3 hours trying the simpler approach. If it works, you save the ongoing maintenance. If it doesn't, you've lost 3 hours but gained certainty."

## Key Phrases to Watch For

- "we've already invested"
- "too far to turn back"
- "just one more fix"
- "almost working"
- "we can't give up now"
- "it would waste the work"
- "we're so close"
- "too late to change"
- "let's just ship it"
- "one more workaround"

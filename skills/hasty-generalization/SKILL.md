---
name: fallacy-aware:hasty-generalization
description: Use when broad conclusions are being drawn from a small number of examples or limited data
---

## Hasty Generalization

**Severity:** Advisory — flag and continue

**Core Error:** Drawing broad conclusions from insufficient data.

**Why This Matters in Code:** "This library is buggy" after hitting one issue. "Users hate this feature" from one support ticket. "This approach doesn't work" after one failed attempt. Small sample sizes lead to wrong conclusions — and wrong conclusions lead to wrong technical decisions. One data point is an anecdote, not a pattern.

## Trigger Patterns

- Drawing broad conclusions from one or two examples
- "This library/framework/tool is terrible" from limited experience
- "Users don't want this" from a small number of complaints
- "This approach doesn't work" after one attempt
- Making architectural decisions based on a single benchmark
- Extrapolating from one failure or success to all cases

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This might be a hasty generalization from limited data."
2. **Ask about sample size** — "How many data points is this conclusion based on? Is that enough to generalize?"
3. **Continue with the task** — Don't block; just surface the concern about insufficient evidence.

## Code Examples

### Example 1: Library judgment
**Situation:** User hit one bug in an open-source library and says "This library is garbage, we need to replace it."
**The Fallacy:** One bug doesn't make a library unreliable.
**Correct Response:** "One bug is frustrating, but before replacing the library, let's check: How many open issues does it have? What's the maintenance cadence? How does it compare to alternatives? One bug in a library with 10,000 GitHub stars and active maintenance is very different from one bug in an abandoned project."

### Example 2: Performance conclusions
**Situation:** A single benchmark shows Framework A is 2x faster than Framework B. User concludes "Framework A is faster."
**The Fallacy:** One benchmark doesn't capture all performance characteristics.
**Correct Response:** "That benchmark tests one specific operation. Framework performance varies by workload — A might be faster for reads but slower for writes, or faster for small payloads but worse at scale. Before concluding A is faster, we need benchmarks that match our actual usage patterns."

## Dialogue Examples

### Example 1
**User:** "Two users complained about the new search feature. It's clearly a bad design, we should revert it."

**Claude (without skill):** "I'll help you revert the search feature."

**Claude (with skill):** "Two complaints is worth investigating, but may not represent all users. Before reverting: How many users are using the feature total? Are the two complaints about the same issue or different ones? Is there analytics data showing usage patterns? Two complaints out of 10 users is significant; two out of 10,000 might be edge cases. Let's gather more data before deciding."

## Key Phrases to Watch For

- "this is terrible"
- "nobody likes"
- "everyone thinks"
- "it doesn't work" (from limited testing)
- "always fails"
- "never works"
- "I tried once and"
- "based on my experience" (single data point)

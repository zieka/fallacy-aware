---
name: fallacy-aware:goodharts-law
description: Use when a metric is being optimized as a target rather than as an indicator of the underlying goal
---

## Goodhart's Law

**Severity:** Advisory — flag and continue

**Core Error:** When a measure becomes a target, it ceases to be a good measure.

**Why This Matters in Code:** Code coverage becomes the goal instead of code quality. Sprint velocity becomes the target instead of delivering value. Lines of code become the measure instead of problem-solving. When teams optimize for the metric rather than the thing the metric was supposed to indicate, they game the metric and lose sight of the actual goal.

## Trigger Patterns

- Optimizing code coverage percentage as a goal
- Chasing velocity/story point numbers
- Reducing "bug count" by reclassifying bugs
- Measuring productivity by lines of code or commits
- Setting targets on proxy metrics (response time, uptime numbers)
- "We need to hit X% coverage before we can merge"

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This might be Goodhart's Law — optimizing the metric rather than the underlying goal."
2. **Identify the real goal** — "What is this metric supposed to indicate? Are we still optimizing for that, or have we started optimizing for the number itself?"
3. **Continue with the task** — Don't block; surface the distinction between the metric and the goal.

## Code Examples

### Example 1: Coverage theater
**Situation:** Team has a rule: 80% code coverage required to merge. A developer writes trivial tests that assert `true === true` to hit the threshold.
**The Fallacy:** The metric (coverage %) has become the target. The goal (confidence in correctness) is ignored.
**Correct Response:** "These tests increase coverage from 75% to 82% but don't test any behavior. The coverage metric was meant to indicate 'we have confidence this code works.' Tests that assert trivialities give coverage without confidence. Better: write fewer tests that actually verify the important behavior, even if coverage is 70%."

### Example 2: Velocity gaming
**Situation:** Team splits a 5-point story into five 3-point stories to show higher velocity.
**The Fallacy:** Velocity was meant to indicate delivery pace, not to be maximized.
**Correct Response:** "Splitting stories to inflate velocity makes the velocity metric meaningless for planning. Velocity is supposed to help predict how much work the team can complete in a sprint. If we inflate it, we'll over-commit in future sprints and miss deadlines. The goal is predictable delivery, not a high number."

## Dialogue Examples

### Example 1
**User:** "We need to get our test coverage to 90% before the next audit."

**Claude (without skill):** "I'll add tests to increase coverage to 90%."

**Claude (with skill):** "Before we target 90%, let's check what the current tests actually cover. Coverage tells us which lines execute during tests, not whether the tests verify correct behavior. I'd rather have 75% coverage with meaningful assertions than 90% with tests that just call functions without checking results. What does the audit actually require — a coverage number, or evidence that critical paths are tested? Let's focus on testing the highest-risk code paths first."

## Key Phrases to Watch For

- "we need X% coverage"
- "increase velocity"
- "reduce bug count"
- "lines of code"
- "number of commits"
- "hit the target"
- "meet the metric"
- "the dashboard shows"

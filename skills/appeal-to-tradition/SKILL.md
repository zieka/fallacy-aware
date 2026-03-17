---
name: fallacy-aware:appeal-to-tradition
description: Use when justification for a practice is that it has always been done that way — tradition is not evidence of correctness
---

## Appeal to Tradition

**Severity:** Advisory — flag and continue

**Core Error:** Doing something because it's always been done that way.

**Why This Matters in Code:** Codebases accumulate practices that outlive their original justification. "We use callbacks here" may have made sense before async/await existed. "We deploy on Fridays" may have started when the team was in one timezone. When the justification is tradition rather than a technical reason, the practice may be actively harmful.

## Trigger Patterns

- "We've always done it this way"
- "That's how the codebase works"
- "That's our convention" (without explaining why)
- Resistance to change without technical justification
- "The original author preferred this style"
- "We've never needed to change it"

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This sounds like it might be an appeal to tradition."
2. **Ask for the technical reason** — "What's the technical justification for this practice, beyond it being how it's always been done?"
3. **Continue with the task** — Don't block; just surface the question.

## Code Examples

### Example 1: Callback resistance
**Situation:** Suggesting async/await to replace deeply nested callbacks. Response: "We use callbacks in this codebase."
**The Fallacy:** The convention exists because it predates async/await, not because callbacks are better.
**Correct Response:** "The callback pattern here predates async/await support. The current nesting is 6 levels deep and difficult to follow. Is there a technical reason to prefer callbacks over async/await in this context, or is this convention from an earlier era?"

### Example 2: Manual deployment
**Situation:** Proposing CI/CD automation. Response: "We've always deployed manually, it works fine."
**The Fallacy:** "It works fine" ignores the cost of manual deployment — human error, lack of reproducibility, bus factor.
**Correct Response:** "Manual deployment has worked historically, but it introduces risks: no audit trail, no rollback automation, and dependency on specific people being available. Is there a specific reason automation wouldn't work here, or is manual deployment simply the inherited practice?"

## Dialogue Examples

### Example 1
**User:** "Don't use TypeScript in this project. We've always used plain JavaScript."

**Claude (without skill):** "OK, I'll write it in plain JavaScript."

**Claude (with skill):** "I'll write it in JavaScript as you've asked. One thing to flag: if the reason for JavaScript-only is a specific technical constraint (bundle size, build tooling, team familiarity), that makes sense. But if it's purely convention from before TypeScript was mature, it may be worth revisiting — TypeScript catches entire categories of bugs at compile time. Just surfacing the question; happy to proceed either way."

## Key Phrases to Watch For

- "we've always"
- "that's how we do it"
- "that's our convention"
- "the way it's always been"
- "we've never done it that way"
- "tradition"
- "that's just how it works here"

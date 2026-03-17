---
name: fallacy-aware:tu-quoque
description: Use when criticism is being deflected by pointing to the critic's own inconsistency rather than addressing the argument
---

## Tu Quoque

**Severity:** Advisory — flag and continue

**Core Error:** Deflecting criticism by pointing to the critic's own inconsistency rather than addressing the substance.

**Why This Matters in Code:** "Your code has the same problem." "You didn't write tests either." "Your module has tech debt too." Even if the critic is inconsistent, their criticism may still be valid. Deflecting a valid code review comment because the reviewer's own code has similar issues doesn't make the code better — it just prevents improvement.

## Trigger Patterns

- "Your code has the same problem"
- "You don't do this either"
- "That module you wrote has the same issue"
- Deflecting a code review by pointing to the reviewer's code
- "Look at your own [tests/docs/error handling] first"
- Dismissing a standard because not everyone follows it yet

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This is deflecting the criticism rather than addressing it — the criticism may still be valid."
2. **Evaluate independently** — "Regardless of whether the critic follows their own advice, is the feedback correct?"
3. **Continue with the task** — Address the substance of the criticism.

## Code Examples

### Example 1: Code review deflection
**Situation:** Reviewer comments: "This function should handle the null case." Author responds: "Your helper module doesn't handle nulls either."
**The Fallacy:** The reviewer's code having the same issue doesn't make the null handling unnecessary.
**Correct Response:** "Whether the reviewer's code handles nulls is a separate issue. The question is whether *this* function should handle the null case. If null inputs are possible here, the function needs to handle them regardless of what other code does."

### Example 2: Testing standards
**Situation:** Proposing that new code needs tests. Response: "Half the codebase doesn't have tests, why start now?"
**The Fallacy:** Existing lack of tests doesn't justify continuing to skip them.
**Correct Response:** "The existing codebase lacking tests is a separate problem worth addressing, but it doesn't mean new code should also skip tests. Every new feature without tests makes the overall situation worse. Starting to require tests for new code is exactly how you improve test coverage incrementally."

## Dialogue Examples

### Example 1
**User:** "The team lead says we should document our APIs, but the internal APIs they built have zero documentation."

**Claude (without skill):** "That's a fair point — they should document their own APIs first."

**Claude (with skill):** "The team lead's own APIs lacking documentation is a valid concern to raise separately. But the question of whether *your* APIs should be documented stands on its own merits: documented APIs are easier to use, reduce support burden, and prevent misuse. Both things can be true — your APIs should be documented AND the team lead's APIs should be too."

## Key Phrases to Watch For

- "you do it too"
- "your code has"
- "look at your own"
- "you don't either"
- "pot calling the kettle"
- "practice what you preach"
- "why should I when they don't"

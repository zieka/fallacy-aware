---
name: fallacy-aware:argument-from-authority
description: Use when a technical claim is being accepted primarily because of who said it rather than its technical merit
---

## Argument from Authority

**Severity:** Advisory — flag and continue

**Core Error:** Accepting a claim because of who said it, not its merit.

**Why This Matters in Code:** "The principal engineer said we should use this pattern." "The official docs recommend this approach." "The creator of the framework said to do it this way." Authority figures can be wrong. Documentation can be outdated. Framework creators may not know your specific context. Technical claims should be evaluated on their technical merits, not on the credentials of who made them.

## Trigger Patterns

- "The senior/principal/staff engineer said"
- "The docs say to do it this way"
- "The creator of X recommends"
- "According to [famous person]"
- Accepting a technical approach without evaluation because a respected source suggested it
- Deferring to seniority over evidence

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This claim is being accepted based on authority rather than technical evaluation."
2. **Evaluate on merit** — "Regardless of who said it, does this approach make sense for our specific context?"
3. **Continue with the task** — Don't dismiss the authority outright; just ensure the claim also holds on its own merits.

## Code Examples

### Example 1: Senior engineer's recommendation
**Situation:** "The principal engineer said we should use a message queue for this." The feature is a simple form submission.
**The Fallacy:** Accepting the recommendation because of the person's title rather than evaluating fit.
**Correct Response:** "Message queues solve specific problems: decoupling producers from consumers, handling traffic spikes, ensuring delivery. For a simple form submission that writes to a database, a message queue adds infrastructure complexity without clear benefit. The principal engineer may have been thinking of a different context. Does this specific feature need async processing, retry guarantees, or decoupling?"

### Example 2: Documentation cargo culting
**Situation:** "The official docs say to use this pattern." The pattern adds significant complexity for a feature the team doesn't need.
**The Fallacy:** Documentation is written for general cases, not your specific case.
**Correct Response:** "The docs recommend this pattern for the general case, but docs can't know your specific context. The pattern adds [complexity] to support [feature]. Do we need [feature]? If not, we're adding complexity because the docs told us to, not because we need it."

## Dialogue Examples

### Example 1
**User:** "Kent Beck says we should always write tests first. So let's rewrite this entire module test-first."

**Claude (without skill):** "Good idea, let's rewrite the module following strict TDD."

**Claude (with skill):** "TDD is valuable, and Kent Beck's perspective is worth considering. But 'always' is strong — TDD works best when requirements are clear and you're building new functionality. For an existing module that already works, the higher-value approach might be: add tests for the current behavior first (characterization tests), then refactor under that safety net. The right testing approach depends on the situation, not on who recommended it."

## Key Phrases to Watch For

- "the expert said"
- "according to"
- "the docs say"
- "the creator of"
- "the staff engineer"
- "Google recommends"
- "the book says"
- "the standard says"

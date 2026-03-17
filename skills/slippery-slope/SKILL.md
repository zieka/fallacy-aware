---
name: fallacy-aware:slippery-slope
description: Use when an argument against a change assumes it will inevitably lead to extreme consequences without evidence for each step
---

## Slippery Slope

**Severity:** Advisory — flag and continue

**Core Error:** Assuming one step inevitably leads to catastrophe without evidence for each intermediate step.

**Why This Matters in Code:** "If we allow one exception to the linting rules, soon nobody will follow any rules." "If we add one configuration option, we'll end up with a thousand." These arguments block reasonable changes by jumping to worst-case scenarios. Each step in a chain needs its own justification — the first step doesn't cause the last.

## Trigger Patterns

- "If we allow X, next thing you know Y"
- "This is a slippery slope to Z"
- "Where do we draw the line?"
- "This sets a dangerous precedent"
- Blocking a small change because of imagined future consequences
- Arguing that any flexibility will lead to chaos

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This reasoning may be a slippery slope."
2. **Examine each step** — "Is there evidence that step A actually leads to step B? Each transition needs its own justification."
3. **Continue with the task** — Don't block; just surface the analysis.

## Code Examples

### Example 1: Linting exceptions
**Situation:** Proposing to disable one lint rule for a specific file. Response: "If we start disabling rules, soon nobody will follow any coding standards."
**The Fallacy:** One targeted exception doesn't cause the collapse of all standards.
**Correct Response:** "Disabling one lint rule in one file for a documented reason is different from abandoning all coding standards. We can add a comment explaining why the exception exists. If exceptions start proliferating, that's a signal the rule doesn't fit the codebase — which is useful information, not chaos."

### Example 2: API flexibility
**Situation:** Adding an optional parameter to an API endpoint. Response: "If we start adding optional parameters, the API will become impossibly complex."
**The Fallacy:** One optional parameter doesn't create API complexity chaos.
**Correct Response:** "One well-documented optional parameter doesn't make an API complex. If this parameter solves a real user need, it should be added. We can address complexity if and when the parameter count actually becomes a problem — but that decision should be based on evidence, not a prediction of inevitable decline."

## Dialogue Examples

### Example 1
**User:** "We can't add tech debt tickets to the sprint. If we start doing that, we'll never ship features again."

**Claude (without skill):** *Accepts the premise and doesn't add tech debt tickets*

**Claude (with skill):** "That reasoning assumes that adding any tech debt work inevitably crowds out all feature work. But most teams successfully allocate 10-20% of capacity to tech debt without impacting feature delivery. The question isn't whether to allow tech debt tickets — it's how much capacity to allocate. One ticket per sprint doesn't lead to zero feature work."

## Key Phrases to Watch For

- "if we allow"
- "slippery slope"
- "where does it end"
- "next thing you know"
- "dangerous precedent"
- "open the floodgates"
- "thin end of the wedge"
- "soon everyone will"

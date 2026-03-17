---
name: fallacy-aware:occams-razor
description: Use when a complex explanation or solution is being preferred over a simpler one that fits the evidence equally well
---

## Occam's Razor

**Severity:** Advisory — flag and continue

**Core Error:** The simplest explanation consistent with evidence is probably right.

**Why This Matters in Code:** When debugging, the temptation is to construct elaborate theories: "It must be a race condition in the distributed cache invalidation." But more often it's a typo, a null pointer, an off-by-one error, or a misconfigured environment variable. When designing solutions, the temptation is to build for every hypothetical: "What if we need to support 10 databases?" But probably you need one. Start with the simplest explanation or solution that fits the evidence.

## Trigger Patterns

- Elaborate debugging theories when a simple explanation exists
- Over-architecting for hypothetical requirements
- "It must be a race condition" for what's probably a null pointer
- Adding layers of indirection for a simple problem
- Complex infrastructure for a simple application
- Preferring a multi-step theory over a one-step explanation

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "Let's consider the simpler explanation first — Occam's Razor."
2. **Start simple** — "What's the simplest explanation that fits the evidence? Have we ruled that out?"
3. **Continue with the task** — Try the simple hypothesis first before investing in the complex one.

## Code Examples

### Example 1: Debugging complexity
**Situation:** An API returns 500 errors intermittently. The team theorizes it's a distributed cache coherence issue between data centers.
**The Fallacy:** The complex explanation is more interesting but less likely.
**Correct Response:** "Before investigating distributed cache coherence, let's check the simple explanations: Is the database connection pool exhausted? Is there a memory leak causing OOM kills? Is a downstream service timing out? Check the error message and stack trace first — intermittent 500s are more often caused by resource exhaustion than by distributed systems issues."

### Example 2: Over-designed solution
**Situation:** Building a feature to send emails. The proposed design includes a message queue, event sourcing, pluggable transport adapters, and a template engine with i18n.
**The Fallacy:** The solution's complexity far exceeds the problem's complexity.
**Correct Response:** "The requirement is to send emails. The simplest solution: call the email API directly with a string template. Add the message queue when you need async/retry. Add transport adapters when you need a second provider. Add i18n when you need multiple languages. Build for what you need today, not what you might need."

## Dialogue Examples

### Example 1
**User:** "Users are seeing stale data. I think there's a bug in our cache invalidation across the CDN edge nodes."

**Claude (without skill):** "Let me investigate the CDN cache invalidation logic."

**Claude (with skill):** "Let's start with the simplest explanations and work up: (1) Is the browser caching the response? Check cache headers. (2) Is the CDN cache TTL longer than expected? (3) Is the application setting the right cache-control headers? (4) Is the database query returning old data due to read replica lag? CDN edge node cache invalidation bugs are possible but rare — stale data is usually a TTL or header configuration issue."

## Key Phrases to Watch For

- "it must be"
- "the only explanation is"
- "it's probably a race condition"
- "we need to support every"
- "what if we need"
- "to be safe, let's"
- "future-proof"

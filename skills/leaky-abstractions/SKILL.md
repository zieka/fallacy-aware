---
name: fallacy-aware:leaky-abstractions
description: Use when an abstraction is failing and the response is to add more abstraction rather than understanding what the abstraction hides
---

## Leaky Abstractions

**Severity:** Advisory — flag and continue

**Core Error:** All non-trivial abstractions eventually force you to understand what they hide.

**Why This Matters in Code:** ORMs leak SQL. HTTP clients leak TCP. "Serverless" leaks server configuration. When an abstraction fails, the instinct is to add another layer of abstraction on top. But the fix is usually to understand the layer beneath — the one that's leaking. Adding more abstraction just moves the leak deeper and makes it harder to diagnose.

## Trigger Patterns

- Adding a wrapper layer to hide ORM quirks
- Abstracting away errors instead of handling them
- "Just add another interface/adapter/layer"
- Fighting framework behavior instead of understanding it
- Creating a "simplified" API that hides essential complexity
- Unexpected behavior from a library or framework that "should just work"

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This abstraction is leaking — adding more abstraction on top won't fix the underlying issue."
2. **Identify the leak** — "What underlying behavior is showing through? Understanding that is the fix, not hiding it."
3. **Continue with the task** — Don't block; surface the observation that the right fix is understanding the layer beneath, not adding layers above.

## Code Examples

### Example 1: ORM wrapper
**Situation:** An ORM generates slow queries. The response is to build a query cache wrapper around the ORM.
**The Fallacy:** The ORM abstraction is leaking SQL performance characteristics. Adding a cache hides the symptom.
**Correct Response:** "The ORM is generating an N+1 query — that's the ORM abstraction leaking SQL reality. A cache will mask the problem for cache hits but won't fix it. The right fix is understanding the SQL: add eager loading or a join to eliminate the N+1. Understanding the layer beneath the abstraction is the fix, not adding a layer above."

### Example 2: Error wrapping
**Situation:** A function catches all exceptions and re-throws them as a generic `ServiceError`, losing the original context.
**The Fallacy:** Abstracting away error types hides information needed to handle errors correctly.
**Correct Response:** "Wrapping all errors as ServiceError loses the distinction between a network timeout, a validation error, and a database constraint violation. The caller needs to handle these differently — retry on timeout, show validation message to user, log and alert on constraint violation. The abstraction is hiding essential complexity. Preserve the error types or use error codes."

## Dialogue Examples

### Example 1
**User:** "The ORM keeps doing weird things with our queries. Let's build a data access layer on top of it to normalize the behavior."

**Claude (without skill):** "I'll create a data access layer that wraps the ORM calls."

**Claude (with skill):** "Adding a layer on top of the ORM adds indirection without fixing the root cause. The ORM is an abstraction over SQL, and it's leaking — the 'weird things' are likely SQL behaviors the ORM doesn't fully abstract. Rather than wrapping the ORM, let's identify what's leaking: Is it query performance? Transaction handling? Join behavior? Understanding the SQL underneath will lead to a targeted fix rather than another layer to debug through."

## Key Phrases to Watch For

- "just wrap it"
- "add a layer"
- "abstract it away"
- "hide the complexity"
- "it should just work"
- "normalize the behavior"
- "another adapter"
- "the framework is doing weird things"

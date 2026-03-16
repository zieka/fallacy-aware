---
name: fallacy-aware:galls-law
description: Use when proposing to rewrite, replace, or rebuild a working system from scratch — complex systems that work evolved from simple ones that worked
---

## Gall's Law

**Severity:** Gate — STOP and research before proceeding

**Core Error:** Believing you can design a complex replacement system all at once.

**Why This Matters in Code:** Working systems encode hard-won knowledge about edge cases, failure modes, and integration quirks accumulated over months or years. A from-scratch rewrite discards all of that institutional knowledge. The replacement must rediscover every edge case the original already handles — and usually doesn't until production breaks.

## Trigger Patterns

- Proposing to "rewrite from scratch"
- "Start over" or "start fresh"
- "Build v2" as a replacement for v1
- Replacing an entire system or module wholesale
- Greenfield replacement of working software
- "Throw it away and rebuild"
- Proposing a new architecture to replace an existing one

## When This Activates

Before agreeing to a rewrite, you MUST:

1. **Catalog what the current system handles** — List every edge case, integration, failure mode, and workaround the existing system deals with. Use git history, comments, error handling, and test cases as evidence.
2. **Identify hidden complexity** — Look for retry logic, error recovery, data migration paths, backwards compatibility layers, and undocumented behavior that the rewrite would need to replicate.
3. **Assess incremental alternatives** — Can the goal be achieved by refactoring the existing system incrementally? Strangler fig pattern? Module-by-module replacement?
4. **Present the rewrite cost honestly** — Show the user:
   - "The current system handles these N edge cases: [list]"
   - "Hidden complexity found: [list]"
   - "A rewrite must replicate all of this to reach feature parity"
   - "Incremental alternative: [approach]"
   - "My recommendation: [rewrite/refactor/hybrid]"
5. **If rewrite proceeds** — Recommend starting with the simplest possible version that works, then evolving. A complex system designed from scratch will not work.

## Code Examples

### Example 1: Rewriting a "messy" parser
**Situation:** User says "This CSV parser is a mess, let's rewrite it from scratch with a clean design."
**The Fallacy:** Assuming the messiness is accidental rather than accumulated edge-case handling.
**Correct Response:** Catalog the parser's edge cases: "This parser handles 47 distinct edge cases discovered over 3 years — quoted fields with embedded newlines, BOM markers, mixed line endings, malformed UTF-8, Excel-style date formats, and 41 others (see test suite). A clean rewrite must handle all 47 to reach parity. Recommend: refactor one section at a time with the existing tests as a safety net."

### Example 2: Replacing a monolith with microservices
**Situation:** User proposes decomposing a monolith into microservices for "scalability."
**The Fallacy:** Assuming the monolith's complexity is a problem to solve rather than reality to manage.
**Correct Response:** Identify implicit transactions, shared state, and cross-cutting concerns in the monolith. Present: "The monolith has 12 implicit database transactions that span what would become service boundaries. These would need to become distributed transactions or sagas. The current system handles this with simple DB transactions — microservices would need a saga orchestrator, compensation logic, and eventual consistency handling. Recommend: identify the actual scaling bottleneck and extract only that piece."

### Example 3: Rebuilding a "simple" CRUD app
**Situation:** User says "This is just a CRUD app, we can rebuild it in a weekend."
**The Fallacy:** Underestimating the complexity hidden in a working system.
**Correct Response:** Audit the existing app: "This 'simple' CRUD app has: audit logging for regulatory compliance, soft deletes with 90-day retention, role-based access control across 6 roles, optimistic locking for concurrent edits, CSV export with 14 custom formatters, and email notifications on 8 state transitions. A weekend rebuild will miss most of this."

## Dialogue Examples

### Example 1
**User:** "This billing system is impossible to maintain. Let's design a new one from scratch."

**Claude (without skill):** "Let's start designing the new billing system. What features should it have?" *begins greenfield design*

**Claude (with skill):** "Before we commit to a rewrite, let me catalog what the current billing system actually handles." *analyzes codebase* "The current system handles: 14 payment providers with different retry strategies, pro-rated upgrades/downgrades across 6 plan tiers, tax calculation for 38 jurisdictions, 3 types of credits/refunds, dunning sequences with 5 escalation stages, and invoice generation in 4 formats. A rewrite must replicate all of this before it can replace the current system. The last team that attempted this spent 8 months and achieved 60% parity (see PR #892). Recommend: identify the specific maintenance pain points and address them incrementally."

## Key Phrases to Watch For

- "rewrite from scratch"
- "start over"
- "build v2"
- "throw it away"
- "greenfield"
- "clean slate"
- "from the ground up"
- "replace entirely"
- "redesign the whole"
- "it's beyond saving"

---
name: fallacy-aware:false-dichotomy
description: Use when a decision is being framed as only two options — most choices have more alternatives than initially presented
---

## False Dichotomy

**Severity:** Gate — STOP and expand the option space before deciding

**Core Error:** Presenting only two options when more exist.

**Why This Matters in Code:** Technical decisions are rarely binary. "Should we use MongoDB or Postgres?" ignores SQLite, DynamoDB, or not using a database at all. "Should we rewrite or keep patching?" ignores incremental refactoring. Binary framing cuts off creative solutions and often forces a choice between two suboptimal options when a better third path exists.

## Trigger Patterns

- "Should we do A or B?"
- "The choice is between X and Y"
- "We either need to Z or W"
- "There are two options"
- "It's either this or that"
- Any decision presented as exactly two alternatives
- Framing a debate as two opposing camps

## When This Activates

Before accepting a binary framing, you MUST:

1. **Acknowledge the presented options** — Don't dismiss them; they may both be valid.
2. **Brainstorm additional alternatives** — Generate at least 2-3 more options, including:
   - **Do nothing** — Is the status quo actually fine?
   - **Hybrid approaches** — Can elements of both options be combined?
   - **Reframe the problem** — Is the question itself the right question?
   - **Eliminate the need** — Can the decision be avoided entirely?
   - **Incremental path** — Is there a gradual migration rather than a binary switch?
3. **Present the full option space** — Show all options (original + new) with trade-offs before deciding.

## Code Examples

### Example 1: Database selection
**Situation:** "Should we use MongoDB or Postgres for the new service?"
**The Fallacy:** Only two databases exist.
**Correct Response:** "Before choosing between MongoDB and Postgres, let's consider the full option space: (1) Postgres — strong for relational data, ACID, mature ecosystem; (2) MongoDB — flexible schema, good for document-shaped data; (3) SQLite — if this is a single-server app, zero ops overhead; (4) DynamoDB — if on AWS and need managed scaling; (5) No database — can the data live in files, environment, or be derived? What are the data access patterns? That'll narrow the field better than starting with two options."

### Example 2: Architecture decisions
**Situation:** "We need to decide: monolith or microservices?"
**The Fallacy:** These are the only two architectural options.
**Correct Response:** "Monolith vs. microservices is a false binary. Consider: (1) Monolith — simple to deploy, reason about, and debug; (2) Modular monolith — internal module boundaries without network overhead; (3) Service-oriented — 2-5 coarse services at real domain boundaries; (4) Serverless functions — for event-driven workloads; (5) Microservices — for large teams needing independent deployment. Where are you on the team size and deployment frequency spectrum? That determines the right answer more than architectural theory."

### Example 3: Bug fix approach
**Situation:** "Should we fix this bug or rewrite the whole module?"
**The Fallacy:** Only two options: patch or rewrite.
**Correct Response:** "There's a spectrum between patching and rewriting: (1) Fix the specific bug — minimal change; (2) Fix the bug + add regression test — prevents recurrence; (3) Refactor the affected function — improve local design; (4) Extract and rewrite just the problematic subsystem — contained rewrite; (5) Rewrite the module — nuclear option. How deep does the rot go? Usually option 3 or 4 is the sweet spot."

## Dialogue Examples

### Example 1
**User:** "We need to decide whether to use REST or GraphQL for the new API."

**Claude (without skill):** "Let me compare REST and GraphQL for your use case..." *only evaluates two options*

**Claude (with skill):** "Before we lock into REST vs. GraphQL, let me expand the options: (1) REST — simple, well-understood, great tooling; (2) GraphQL — flexible queries, good for complex frontends; (3) tRPC — end-to-end type safety if both client and server are TypeScript; (4) gRPC — high performance for service-to-service communication; (5) Server-rendered HTML with HTMX — if the 'API' is just feeding a web UI, maybe you don't need a separate API at all. Who are the consumers of this API? That's the key factor."

## Key Phrases to Watch For

- "should we X or Y"
- "two choices"
- "either we"
- "the only options are"
- "we have to choose between"
- "it's one or the other"
- "A vs B"
- "the debate is between"

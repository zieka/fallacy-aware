---
name: fallacy-aware:appeal-to-novelty
description: Use when something is being chosen primarily because it is new — newness is not evidence of superiority
---

## Appeal to Novelty

**Severity:** Advisory — flag and continue

**Core Error:** Assuming something is better because it's new.

**Why This Matters in Code:** The JavaScript ecosystem ships a new framework every week. A new tool may be genuinely better — or it may be immature, poorly documented, and lacking the battle-tested edge-case handling of the boring option. Newness correlates with excitement, not reliability. Choosing technology because it's exciting rather than because it solves your problem leads to resume-driven development.

## Trigger Patterns

- Choosing a framework/library primarily because it's new or trending
- "X just came out and it's way better"
- Switching tools mid-project for a newer alternative
- Dismissing established tools as "old" or "legacy"
- Excitement about a technology without evaluating its maturity
- "Everyone's moving to X"

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This might be an appeal to novelty."
2. **Ask for the evaluation** — "What specific problem does the new tool solve that the current one doesn't? What are we giving up by switching?"
3. **Continue with the task** — Don't block; just surface the question.

## Code Examples

### Example 1: The hot new framework
**Situation:** User wants to rewrite a React app in the latest framework that launched last month.
**The Fallacy:** The new framework is better because it's newer and has momentum.
**Correct Response:** "The new framework looks promising, but it's one month old. Questions to consider: How mature is the ecosystem (routing, state management, testing)? How large is the community for support? What's the migration cost? The current React app has a stable ecosystem, extensive documentation, and proven patterns. What specific limitation of React is driving this switch?"

### Example 2: Switching languages mid-project
**Situation:** User wants to rewrite backend from Python to Rust because "Rust is the future."
**The Fallacy:** Newer/trendier language is automatically the right choice.
**Correct Response:** "Rust has genuine advantages for performance-critical and memory-safety-critical applications. But for this CRUD API, Python's performance is adequate and the team knows Python. Switching to Rust for a non-performance-critical service trades a working codebase the team can maintain for a rewrite in a language with a steeper learning curve. What specific problem would Rust solve here that Python can't?"

## Dialogue Examples

### Example 1
**User:** "Let's switch from PostgreSQL to this new distributed database. It just hit 1.0 and the benchmarks look amazing."

**Claude (without skill):** "Sure, let me look into migrating to the new database."

**Claude (with skill):** "The benchmarks are impressive, but a few things to consider before switching from Postgres: this database just hit 1.0 — what's the production track record? Postgres has decades of battle-testing, extensive tooling, and your team already knows it. What specific limitation of Postgres is this solving? If it's scale, have you exhausted Postgres scaling options (read replicas, partitioning, connection pooling)? Flagging this as a potential appeal to novelty — newness and impressive benchmarks don't automatically mean it's the right choice for your use case."

## Key Phrases to Watch For

- "just came out"
- "brand new"
- "latest"
- "cutting edge"
- "everyone's moving to"
- "the future"
- "modern"
- "legacy" (used dismissively)
- "old" (used dismissively)
- "trending"

---
name: fallacy-aware:second-system-effect
description: Use when designing a replacement or next-generation system — the second build is where engineers over-engineer, adding every feature they wished the first had
---

## Second System Effect

**Severity:** Gate — STOP and research before proceeding

**Core Error:** Overloading a rebuild with every feature wish from the original.

**Why This Matters in Code:** The first system was constrained by ignorance — you didn't know what you needed, so you built only what was essential. That constraint was healthy. The second system is unconstrained by experience — you now know everything you wished you had, and the temptation is to build all of it at once. Engineers add "just one more thing" until the replacement is more complex than what it replaced.

## Trigger Patterns

- Designing v2, "next-gen," or a replacement system
- "This time we'll do it right"
- Adding features to a replacement that the original didn't have
- Scope creeping a rebuild with "while we're at it" additions
- Requirements for the new system growing beyond what the old one did
- Designing for hypothetical future needs during a rebuild

## When This Activates

Before proceeding with an expanded rebuild, you MUST:

1. **List what the replacement actually needs** — Define the minimum feature set required for the new system to replace the old one. This is the only scope that matters.
2. **Compare against what's proposed** — List every feature in the proposed design that wasn't in the original.
3. **Flag scope additions** — For each addition, ask: "Is this solving a real problem we have today, or scratching an itch?"
4. **Present the delta** — Show the user:
   - "Minimum viable replacement needs: [list]"
   - "Proposed additions beyond that: [list]"
   - "Each addition increases risk of the replacement never shipping"
   - "Recommend: ship minimum replacement first, add features after it's working"

## Code Examples

### Example 1: The config parser rewrite
**Situation:** Rewriting a JSON config parser. The new design supports JSON, YAML, TOML, INI, environment variables, and remote config servers.
**The Fallacy:** The original only needed JSON, but "while we're at it" the team wants to support everything.
**Correct Response:** "The current system uses JSON exclusively. The proposed replacement adds 5 additional config formats and remote config support. Do we have evidence that users need YAML, TOML, INI, env vars, or remote config? If not, these additions increase the surface area for bugs without solving a real problem. Recommend: replace with a clean JSON parser, add formats only when there's demonstrated demand."

### Example 2: The auth system rebuild
**Situation:** Rebuilding auth. Original had email/password. New design includes SSO, SAML, OAuth, LDAP, WebAuthn, magic links, and SMS OTP.
**The Fallacy:** Since we're rebuilding auth anyway, we should support "everything."
**Correct Response:** "The original auth system serves the current user base with email/password. The proposed replacement adds 6 auth methods. Which of these do current users actually need? Adding auth methods you don't need yet creates maintenance burden and security surface area. Recommend: rebuild with email/password + OAuth (if there's demand), add others when requested."

### Example 3: The "while we're at it" migration
**Situation:** Migrating from one database to another. Scope expands to include new indexing strategy, new caching layer, read replicas, and a query builder DSL.
**The Fallacy:** Since we're touching the data layer anyway, we should fix everything.
**Correct Response:** "The migration goal is to move from database A to database B. The proposed scope now includes 4 additional infrastructure changes. Each addition is a project in its own right. Bundling them with the migration increases the risk that the migration itself fails or stalls. Recommend: migrate first with minimal changes, then tackle optimizations as separate projects."

## Dialogue Examples

### Example 1
**User:** "We're redesigning the notification system. This time let's add support for email, SMS, push, Slack, Teams, Discord, webhooks, and in-app notifications."

**Claude (without skill):** "Great, let's design a notification system that supports all 8 channels." *begins over-engineered design*

**Claude (with skill):** "What channels does the current notification system support?" *checks* "The current system sends email only. You're proposing to go from 1 channel to 8 in the rebuild. That's not a redesign — it's a 7x scope expansion. Which channels do users actually use or request today? Recommend: rebuild with email + the single most-requested additional channel. Add others incrementally after the core system proves stable."

## Key Phrases to Watch For

- "v2"
- "next version"
- "this time we'll"
- "while we're at it"
- "redesign"
- "do it right this time"
- "since we're already"
- "might as well add"
- "future-proof"
- "support everything"

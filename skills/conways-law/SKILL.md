---
name: fallacy-aware:conways-law
description: Use when system architecture problems may reflect organizational structure rather than technical decisions, or vice versa
---

## Conway's Law

**Severity:** Advisory — flag and continue

**Core Error:** Systems mirror the organizational structure that built them — for better or worse.

**Why This Matters in Code:** If you have three teams, you'll get a three-service architecture regardless of whether three services is the right design. API boundaries often follow team boundaries rather than domain boundaries. Trying to change architecture without addressing org structure (or vice versa) is fighting Conway's Law — and Conway's Law usually wins.

## Trigger Patterns

- API boundaries that match team boundaries rather than domain boundaries
- "That's team X's problem" when it's really a system design issue
- Architecture decisions driven by team structure rather than technical requirements
- Proposing a microservices split that matches the org chart
- Cross-team integration problems that reflect communication problems
- "We need a new service" when the real need is better team coordination

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "This architecture might be reflecting org structure rather than domain boundaries — Conway's Law."
2. **Check alignment** — "Do the service/module boundaries align with domain boundaries, or with team boundaries? These aren't always the same."
3. **Continue with the task** — Don't block; surface the structural influence.

## Code Examples

### Example 1: Team-shaped services
**Situation:** Three teams propose splitting a monolith into three services: user-service, order-service, and notification-service — one per team.
**The Fallacy:** The split follows team boundaries, not domain boundaries.
**Correct Response:** "The proposed service split mirrors the team structure exactly. That's worth examining: Does user-service need to call order-service for every request? If so, you've created a distributed monolith — the same coupling but with network calls. The domain boundaries might be: checkout-flow (spanning users and orders) and communication (notifications). Consider whether the service boundaries should follow data coupling rather than team ownership."

### Example 2: Cross-team friction
**Situation:** Two teams can't agree on an API contract. Each wants the other to do the data transformation.
**The Fallacy:** The technical problem (API design) is actually an organizational problem (ownership and communication).
**Correct Response:** "This API contract dispute looks technical but may be organizational. Neither team wants to own the transformation because it falls between their responsibilities. Options: (1) A shared library that both teams contribute to, (2) Assign clear ownership of the boundary, (3) Create a thin integration team/role. The API design will follow whatever organizational structure you choose."

## Dialogue Examples

### Example 1
**User:** "We need to split the backend into microservices — one per team."

**Claude (without skill):** "Let's design the microservice boundaries around the team structure."

**Claude (with skill):** "Before splitting by team, let's check whether team boundaries match domain boundaries. Conway's Law says the architecture will mirror the org structure — so if we split by team, we get team-shaped services. Are those the right service boundaries? Let me map the data flow and coupling first. If Team A's service needs to call Team B's service on every request, that's a distributed monolith, not microservices."

## Key Phrases to Watch For

- "one service per team"
- "that's their problem"
- "team X owns that"
- "we need our own service"
- "cross-team dependency"
- "the other team's API"
- "org restructure"

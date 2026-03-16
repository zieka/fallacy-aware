---
name: fallacy-aware:cargo-culting
description: Use when adopting patterns, tools, frameworks, or practices without understanding why they work — copying form without understanding function
---

## Cargo Culting

**Severity:** Gate — STOP and understand before adopting

**Core Error:** Adopting a practice because others do it, without understanding why it works or whether you have the problem it solves.

**Why This Matters in Code:** Cargo-culted code adds complexity without benefit. The pattern may solve a problem you don't have, require constraints you can't meet, or depend on context that doesn't apply to your situation. Worse, it creates a false sense of security — you think you have the benefits of the pattern, but without understanding the "why," you often get only the costs.

## Trigger Patterns

- Copying patterns from Stack Overflow or blog posts without adapting them
- "Netflix/Google/Uber does it this way"
- Adopting a framework or tool because it's popular
- Adding design patterns (factory, observer, strategy) for their own sake
- Implementing microservices, event sourcing, or CQRS "because that's what you do"
- Using Kubernetes for a single-server app
- Adding caching without measuring whether there's a performance problem
- Following "best practices" without understanding what problem they solve

## When This Activates

Before adopting a pattern, tool, or practice, you MUST:

1. **Identify the problem it solves** — What specific problem was this pattern designed to address?
2. **Ask: do we have that problem?** — Is the problem this solves actually present in our codebase/system?
3. **Identify the constraints** — What does this pattern require to work well? (team size, traffic volume, organizational structure, etc.)
4. **Ask: do we meet those constraints?** — Are the prerequisites satisfied?
5. **Present the analysis:**
   - "This pattern/tool solves: [specific problem]"
   - "We [do/don't] have that problem because: [evidence]"
   - "It requires: [constraints]"
   - "We [do/don't] meet those because: [evidence]"
   - "Simpler alternative: [if applicable]"
   - "Recommendation: [adopt/skip/use simpler alternative]"

## Code Examples

### Example 1: Kubernetes for a weekend project
**Situation:** User wants to deploy a personal blog with 100 daily visitors on Kubernetes.
**The Fallacy:** Kubernetes is what "real" engineers use, so it must be the right choice.
**Correct Response:** "Kubernetes solves container orchestration at scale — managing hundreds of containers across multiple nodes with automated scaling, self-healing, and rolling deployments. Your blog has 100 daily visitors and runs a single container. K8s adds significant operational complexity (networking, ingress, secrets management, cluster maintenance) without solving a problem you have. A single VPS with docker-compose, or a managed platform like Railway/Fly.io, gives you everything you need with near-zero ops overhead."

### Example 2: Event sourcing for a todo app
**Situation:** User is building a task management app and wants to implement event sourcing because "it's the right architecture."
**The Fallacy:** Event sourcing is architecturally "correct" regardless of context.
**Correct Response:** "Event sourcing solves auditability, temporal queries, and complex domain replay for systems with high-value state transitions (financial systems, regulatory applications). Your task management app has simple CRUD operations — tasks are created, updated, completed, deleted. Event sourcing adds: event store, projections, eventual consistency, snapshot management, and event versioning. A simple relational database with created_at/updated_at timestamps gives you everything you need. If you later need audit trails, add an audit log table."

### Example 3: Design patterns for their own sake
**Situation:** Code review shows a class that implements the Factory, Strategy, and Observer patterns for what amounts to a single function with an if/else.
**The Fallacy:** More patterns = better code.
**Correct Response:** "This code uses 3 design patterns (Factory, Strategy, Observer) to accomplish what a single function with a conditional would do. Design patterns solve specific problems: Factory abstracts object creation when you have many types, Strategy makes algorithms interchangeable when you have many variants, Observer decouples producers from consumers at scale. Here, there's one type, one algorithm, and one consumer. The patterns add 200 lines of indirection without solving a problem. Recommend: replace with a simple function."

## Dialogue Examples

### Example 1
**User:** "Let's add Redis caching. Every production app needs a caching layer."

**Claude (without skill):** "I'll set up Redis and add caching to the API responses." *adds Redis dependency and caching layer*

**Claude (with skill):** "Before adding caching, let me check if we have a performance problem that caching would solve." *profiles the application* "Current API response times average 45ms, well within your SLA of 200ms. Database queries are efficient and indexed. Adding Redis introduces: a new infrastructure dependency, cache invalidation logic, potential stale data bugs, and operational overhead. What specific performance problem are you trying to solve? If response times are acceptable, caching adds complexity without benefit."

## Key Phrases to Watch For

- "best practice"
- "industry standard"
- "everyone uses"
- "Google/Netflix/Uber does"
- "you're supposed to"
- "the right way to do it"
- "proper architecture"
- "production-ready"
- "enterprise-grade"
- "that's how it's done"

---
name: fallacy-aware:hyrums-law
description: Use when changing observable behavior of APIs, libraries, CLI tools, or shared interfaces — at scale, all observable behavior is depended on by someone
---

## Hyrum's Law

**Severity:** Gate — STOP and research before proceeding

**Core Error:** Assuming you can change observable behavior without breaking consumers who depend on it.

**Why This Matters in Code:** At sufficient scale, every observable behavior of your system will be depended on by somebody. Error message text, response ordering, timing characteristics, side effects — if it's observable, someone has built around it, even if it was never part of your contract.

## Trigger Patterns

- Changing API response shape, field names, or data types
- Modifying error messages or error codes
- Reordering output, results, or side effects
- Changing default values or configuration
- Renaming public interfaces, methods, or endpoints
- Altering timing or performance characteristics
- Modifying logging format or output
- Changing behavior that was previously undocumented but consistent

## When This Activates

Before changing observable behavior, you MUST:

1. **Identify all observable changes** — List every behavior that will differ after the change, including non-obvious ones like ordering, timing, and error messages.
2. **Search for consumers** — Find all callers, importers, and dependents. Check internal code, external consumers, documentation, and tests that assert on current behavior.
3. **Check for undocumented dependencies** — Look for code that parses error messages, relies on specific ordering, depends on timing, or pattern-matches on output format.
4. **Assess blast radius** — How many consumers are affected? Are they internal or external? Can they be updated simultaneously?
5. **Present findings and propose migration** — Show the user what could break and offer a migration path:
   - "These observable behaviors will change: [list]"
   - "Found N consumers depending on current behavior: [list]"
   - "Proposed migration: [approach]"
   - "Risk level: [low/medium/high]"

## Code Examples

### Example 1: Changing error message text
**Situation:** User asks to improve error messages for clarity: changing "Invalid input" to "Email address must contain @".
**The Fallacy:** Assuming error messages are just for humans.
**Correct Response:** Search reveals a downstream service parses error responses and matches on "Invalid input" to trigger retry logic. Present: "The error message 'Invalid input' is parsed by the order-validation service (src/validators/order.js:45) to decide whether to retry. Changing this text will break that regex match. Recommend: add a machine-readable error code field alongside the human message."

### Example 2: Reordering JSON response keys
**Situation:** Claude refactors an API handler and the JSON keys come out in a different order.
**The Fallacy:** Assuming JSON key order doesn't matter per spec.
**Correct Response:** While JSON spec doesn't guarantee order, some consumers may depend on it. Check test assertions, client-side parsing, and any diff-based tooling. Present: "Found 3 integration tests asserting exact JSON key order. The mobile client's snapshot tests will also fail. Recommend: update tests if key order truly doesn't matter, or preserve order if external consumers expect it."

### Example 3: Speeding up an API endpoint
**Situation:** User optimizes a query, reducing response time from 200ms to 5ms.
**The Fallacy:** Assuming faster is always better.
**Correct Response:** Research reveals a consumer uses the response time as implicit rate limiting. Present: "The batch-import service sends requests in sequence and relies on the ~200ms response time to stay under the upstream rate limit. Dropping to 5ms could trigger rate limiting on the payment provider. Recommend: add explicit rate limiting in the batch-import service before deploying this speedup."

## Dialogue Examples

### Example 1
**User:** "Refactor the CLI output to use JSON instead of plain text."

**Claude (without skill):** "I'll update the CLI to output JSON format." *changes output format*

**Claude (with skill):** "Before changing the output format, let me check what depends on the current plain text output." *searches codebase and scripts* "Found 4 shell scripts in ops/ that pipe this CLI's output through awk and grep to extract fields. The deploy script (ops/deploy.sh:23) parses the third column of the text output for the service version. Changing to JSON will break these scripts. Options: (1) add a --format=json flag while keeping text as default, (2) update all scripts first then switch, (3) output both formats during a transition period. What would you prefer?"

## Key Phrases to Watch For

- "refactor the API"
- "change the response"
- "rename"
- "update the interface"
- "clean up the output"
- "improve the error message"
- "change the default"
- "reorder"
- "restructure"

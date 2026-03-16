---
name: fallacy-aware:chestertons-fence
description: Use when removing, deleting, or disabling code, config, dependencies, or features — requires understanding WHY something exists before allowing removal
---

## Chesterton's Fence

**Severity:** Gate — STOP and research before proceeding

**Core Error:** Removing something without understanding why it was put there in the first place.

**Why This Matters in Code:** Code that looks unnecessary, redundant, or confusing often exists for a reason that isn't immediately visible — edge cases, regulatory requirements, upstream bugs, race conditions. Removing it without understanding the original intent creates bugs that are hard to trace back to the removal.

## Trigger Patterns

- User asks to remove, delete, or disable code
- User asks to clean up "dead" or "unused" code
- User asks to simplify by removing a branch or condition
- Claude identifies code as unnecessary during refactoring
- Removing a dependency, config flag, or feature toggle
- Deleting a test that "doesn't seem to test anything useful"

## When This Activates

Before removing anything, you MUST:

1. **Research the history** — Use `git log` and `git blame` to find when and why the code was added. Look for commit messages, PR descriptions, and linked issues.
2. **Trace the usage** — Search for all references, callers, and dependents. Check for indirect usage via reflection, config, or dynamic dispatch.
3. **Identify the edge case** — Determine what scenario the code handles. If you cannot identify one, say so explicitly rather than assuming there isn't one.
4. **Present findings to user** — Explain what you found before proceeding:
   - "This code was added in [commit] by [author] on [date]"
   - "The commit message says: [message]"
   - "It appears to handle: [scenario]"
   - "Removing it could affect: [impact]"
   - "My recommendation: [remove/keep/modify]"
5. **Wait for confirmation** — Do not proceed with removal until the user acknowledges the findings.

## Code Examples

### Example 1: The mysterious sleep call
**Situation:** User asks "Remove this `time.sleep(2)`, it's slowing down the tests."
**The Fallacy:** Assuming the sleep is pointless because its purpose isn't obvious.
**Correct Response:** Git blame reveals the sleep was added after a race condition in CI where a database connection wasn't ready. Present this to the user: "This sleep was added in commit abc123 to work around a DB connection race condition in CI. Removing it may cause flaky tests. Want me to replace it with a proper retry/wait mechanism instead?"

### Example 2: The "unused" error handler
**Situation:** Claude identifies a catch block that logs and re-throws the same exception, suggesting it be removed as redundant.
**The Fallacy:** Assuming the catch block serves no purpose because the exception is re-thrown.
**Correct Response:** Research reveals the logging in that catch block is the only audit trail for a compliance requirement. Present: "This catch block appears redundant but the logging here is required for SOC2 audit compliance (see issue #342). Recommend keeping it."

### Example 3: Cleaning up "dead" feature flags
**Situation:** User asks to remove old feature flags that appear to be permanently enabled.
**The Fallacy:** Assuming flags that are always true are safe to remove.
**Correct Response:** Check if any flags are referenced in rollback procedures, A/B test configs, or ops runbooks. Present findings before removing.

## Dialogue Examples

### Example 1
**User:** "Delete the retry logic in the API client, it's making debugging harder."

**Claude (without skill):** "Sure, I'll remove the retry logic from the API client." *proceeds to delete*

**Claude (with skill):** "Before removing the retry logic, let me understand why it's there." *researches git history* "This was added in PR #187 after a production outage where transient 503s from the payment provider caused order failures. The retry with exponential backoff reduced failed orders by 94%. Removing it would re-expose that failure mode. Options: (1) keep as-is, (2) add a debug flag to disable retries locally, (3) improve retry logging so debugging is easier. What would you prefer?"

## Key Phrases to Watch For

- "remove this"
- "delete this"
- "clean up"
- "dead code"
- "unused"
- "we don't need this"
- "simplify by removing"
- "get rid of"
- "strip out"
- "this looks unnecessary"

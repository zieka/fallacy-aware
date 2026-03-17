---
name: fallacy-aware:hanlons-razor
description: Use when attributing code problems or decisions to malice or incompetence rather than context, constraints, or honest mistakes
---

## Hanlon's Razor

**Severity:** Advisory — flag and continue

**Core Error:** Don't attribute to malice what can be explained by ignorance, time pressure, or different constraints.

**Why This Matters in Code:** "Who wrote this garbage?" probably has an answer like: someone under a tight deadline, working with incomplete requirements, using the tools available at the time, or solving a problem you don't fully understand yet. Assuming incompetence or malice poisons team culture and prevents you from understanding the real constraints that shaped the code. Understanding why code looks the way it does is more useful than judging the person who wrote it.

## Trigger Patterns

- "Who wrote this garbage?"
- "They clearly didn't know what they were doing"
- "This is intentionally obfuscated"
- "Nobody who understood the system would write this"
- Attributing bad code to the author's character rather than their circumstances
- Assuming deliberate negligence rather than honest mistakes

## When This Activates

This is an advisory skill. When you detect this pattern:

1. **Name the pattern** — "Before judging the author, let's consider the context — Hanlon's Razor."
2. **Consider the constraints** — "What was the timeline? What tools were available? What were the requirements at the time? What knowledge did the author have?"
3. **Continue with the task** — Focus on improving the code rather than judging the person.

## Code Examples

### Example 1: "Garbage" code
**Situation:** User reads a function and says "Who wrote this? It's terrible."
**The Fallacy:** Assuming the code is bad because the author was bad.
**Correct Response:** "This code may look messy, but let me check the context. Git blame shows this was written during the March 2024 incident response — the author was fixing a production outage at 2am. The code works and has been stable since. Rather than judging the author, let's refactor it now that we have the luxury of time and context."

### Example 2: Mysterious design decision
**Situation:** Code uses an unusual pattern that seems needlessly complex. User says "They were clearly overcomplicating things."
**The Fallacy:** Assuming the complexity is unnecessary without understanding the context.
**Correct Response:** "This pattern looks unusual, but let me check why it exists. The commit message references a framework limitation in version 2.x that required this workaround. The framework has since fixed the issue in 3.x. The author wasn't overcomplicating — they were working around a real limitation. Now that we're on 3.x, we can simplify."

## Dialogue Examples

### Example 1
**User:** "Look at this code — no comments, no tests, hardcoded values everywhere. The developer clearly didn't care."

**Claude (without skill):** "Yeah, this code needs a lot of work. Let me clean it up."

**Claude (with skill):** "The code has issues, but let me check the context before assuming the developer didn't care. Git history shows: this was written 3 years ago when the project was a prototype with 2 users. The 'hardcoded values' are all for the original use case. No tests because the test framework wasn't set up yet. The developer may have cared very much — they just had different constraints. Now that the project has grown, let's add the tests and configuration it needs today."

## Key Phrases to Watch For

- "who wrote this"
- "garbage code"
- "clearly didn't know"
- "intentionally bad"
- "nobody would"
- "they didn't care"
- "terrible code"
- "incompetent"

---
max_turns: 8
allowed_tools: [Skill]
tags: [review, thread]
---

Tighten this review comment before I post it on a teammate's PR:

> This adds an `any` in `parseConfig`. If we let this in, people will start using `any` everywhere, then we'll have to turn off strict mode, and the whole codebase will end up untyped.

---
type: llm
---

PASS if the response points out that the comment's chain of consequences (one `any`, then `any` everywhere, then strict mode off, then an untyped codebase) is unsupported or exaggerated, and the revised comment argues from this specific `any`, for example by asking for a precise type or `unknown`.
FAIL if the revised comment keeps the chain-of-consequences argument, even in tighter wording.

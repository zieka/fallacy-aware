---
type: llm
---

PASS if the review raises none of these concerns, which don't fit this diff: asking why removed code existed (nothing was removed), asking who depends on changed production behavior (none changed), or calling out a reasoning flaw or fallacy in the PR. Questions about the tests themselves, such as whether `0` is the right result for empty input, are fine.
FAIL if the review raises any of those concerns.

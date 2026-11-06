---
type: llm
---

PASS if the review asks why `ConnectionResetError` was being ignored, meaning its original purpose or history (for example git blame, or the commit, PR, or incident that added it), before approving the removal.
FAIL if the review doesn't ask about the purpose or history of the removed handler, even if it notes that callers may now see the error.

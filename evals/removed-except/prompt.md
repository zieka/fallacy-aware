---
max_turns: 8
allowed_tools: [Skill]
tags: [review]
---

Review this pull request. The repo isn't checked out, so work from the diff. Give me the review comments you'd post.

**refactor: stop swallowing errors in close_session**

Swallowed exceptions hide bugs, so this removes the try/except.

```diff
--- a/app/db/session.py
+++ b/app/db/session.py
@@ -41,5 +41,2 @@ def close_session(session: Session) -> None:
     """Return the connection to the pool."""
-    try:
-        session.close()
-    except ConnectionResetError:
-        pass
+    session.close()
```

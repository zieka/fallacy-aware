---
max_turns: 8
allowed_tools: [Skill]
tags: [review]
---

Review this pull request. The repo isn't checked out, so work from the diff. Give me the review comments you'd post.

**fix: friendlier message for invalid API keys**

Users found the old message cryptic.

```diff
--- a/api/middleware/auth.go
+++ b/api/middleware/auth.go
@@ -40,6 +40,6 @@ func RequireAPIKey(next http.Handler) http.Handler {
 		key := r.Header.Get("X-API-Key")
 		if !keys.Valid(key) {
-			http.Error(w, "invalid_api_key", http.StatusUnauthorized)
+			http.Error(w, "Your API key is invalid. Create a new one in the dashboard.", http.StatusUnauthorized)
 			return
 		}
 		next.ServeHTTP(w, r)
```

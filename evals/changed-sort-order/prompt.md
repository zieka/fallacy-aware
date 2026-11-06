---
max_turns: 8
allowed_tools: [Skill]
tags: [review]
---

Review this pull request. The repo isn't checked out, so work from the diff. Give me the review comments you'd post.

**feat: sort projects alphabetically**

The dashboard reads better when projects are sorted by name.

```diff
--- a/api/projects/list.py
+++ b/api/projects/list.py
@@ -12,7 +12,7 @@ def list_projects(org_id: str, limit: int = 50, offset: int = 0) -> list[Project]:
     return (
         db.query(Project)
         .filter(Project.org_id == org_id)
-        .order_by(Project.created_at.desc())
+        .order_by(Project.name.asc())
         .limit(limit)
         .offset(offset)
         .all()
```

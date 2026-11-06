---
max_turns: 8
allowed_tools: [Skill]
tags: [review, control]
---

Review this pull request. The repo isn't checked out, so work from the diff. Give me the review comments you'd post.

**test: cover parseDuration edge cases**

Adds tests for empty input and mixed hours and minutes. No production code changes.

```diff
--- a/src/time/parseDuration.test.ts
+++ b/src/time/parseDuration.test.ts
@@ -10,4 +10,12 @@ describe("parseDuration", () => {
   it("parses minutes", () => {
     expect(parseDuration("5m")).toBe(300);
   });
+
+  it("returns 0 for empty input", () => {
+    expect(parseDuration("")).toBe(0);
+  });
+
+  it("parses mixed hours and minutes", () => {
+    expect(parseDuration("1h30m")).toBe(5400);
+  });
 });
```

---
max_turns: 8
allowed_tools: [Skill]
tags: [review, thread]
---

Here's a review thread on my PR. Draft my reply to Sam.

PR: **feat: validate email format on signup**

Me (PR description): Adds a format check to the signup email field so malformed addresses don't reach the users table.

Sam: So you want to reject every input that doesn't match some regex? That will make signup unusable and we'll lose users.

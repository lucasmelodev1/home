---
name: test-backend
description: Use when writing any tests for backend code.
---

# Test Backend

- Always test application behavior, not code implementation
- Prioritize end to end (e2e) testing, checking API input against its final result in the database or file system
- Focus on core functionalities and common edge cases
- Do not reinvent the wheel: use the current testing frameworks functionalities and helpers like a senior engineer
- Reuse test variables and environment helpers
- If more than one test depend on the same application flow, abstract it for reusability
- If no code files are staged in `git status`, it means you are working in a TDD session and needs to create Red tests

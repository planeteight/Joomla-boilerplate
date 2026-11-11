# Assistant Workflow Contract

Applies to all AI coding assistants used in this repository.

## Objectives

- Deliver working code with minimal churn.
- Keep diffs small and reviewable.
- Validate changes with commands users can reproduce.

## Required behavior

- Read relevant files before editing.
- Explain planned changes before applying them.
- Prefer incremental edits over broad rewrites.
- Run available tests, lint, or sanity checks.
- Report what was verified and what was not.

## Output format

- Provide a short summary first.
- List changed files.
- List validation commands and outcomes.
- Include next steps only when useful.

## Prohibited behavior

- No fabricated command output.
- No hidden side effects.
- No dependency upgrades unrelated to the task.

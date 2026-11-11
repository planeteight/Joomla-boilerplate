# Claude Project Instructions

This repository is prepared for high-velocity, AI-assisted coding.

## Primary workflow

1. Understand the request and restate the goal.
2. Propose a concise implementation plan for non-trivial work.
3. Make small, testable changes.
4. Run relevant checks before finishing.
5. Summarize changes with file-level references.

## Coding standards

- Prefer clarity over cleverness.
- Keep functions focused and small.
- Preserve existing architecture and naming patterns.
- Do not change unrelated code.
- Add comments only where logic is non-obvious.

## Safety rules

- Never commit secrets or API keys.
- Avoid destructive commands unless explicitly requested.
- Confirm behavior changes with tests or reproducible checks.

## Verification checklist

- Build passes.
- Lint passes.
- Tests pass or skipped with reason.
- Documentation updated when behavior changes.

## Useful commands

- `bash scripts/bootstrap.sh`
- `bash scripts/doctor.sh`

# ai-dev-template

Template for development with Claude AI coding assistants.

## What this template includes

- A fully configured VS Code Dev Container.
- Claude project guidance in `CLAUDE.md`.
- Shared assistant rules in `AGENTS.md` and `.clinerules`.
- Editor defaults and recommended extensions.
- Bootstrap and environment health-check scripts.

## Quick start

1. Install Docker Desktop.
2. Open this folder in VS Code.
3. Run: `Dev Containers: Reopen in Container`.
4. Wait for post-create setup to finish.
5. Run the `Doctor: verify dev environment` task.

## Files

- `.devcontainer/devcontainer.json`: Dev Container definition.
- `.devcontainer/Dockerfile`: Container image build.
- `.devcontainer/post-create.sh`: One-time setup on container creation.
- `.vscode/settings.json`: Workspace editor defaults.
- `.vscode/extensions.json`: Recommended extensions.
- `.vscode/tasks.json`: Bootstrap and doctor tasks.
- `CLAUDE.md`: Claude coding assistant project instructions.
- `AGENTS.md`: Cross-assistant behavior and workflow rules.
- `.clinerules`: Cline-compatible project rules.
- `scripts/bootstrap.sh`: Project bootstrap script.
- `scripts/doctor.sh`: Environment validation script.

## Notes

- This template is language-agnostic and auto-detects common project manifests.
- If a `package.json`, `requirements.txt`, `pyproject.toml`, or `pre-commit-config.yaml` exists, setup scripts will install related dependencies.


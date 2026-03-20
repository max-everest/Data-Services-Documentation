# Agent Deploy Instructions

Purpose: provide precise guidance so the agent can publish the site when the user requests a deploy.

Behavior rules:
- When the user asks to "deploy the site" or similar, confirm intent before taking action.
- Use the repository's deploy script at `scripts/deploy.ps1` as the canonical publish command.
- Activate the project's Python virtual environment first: `& .\\.venv\\Scripts\\Activate.ps1`.
- Run `scripts/deploy.ps1` in the repository root and stream output back to the user.
- If the user cancels at confirmation, stop immediately and do not run the script.
- If `scripts/deploy.ps1` is missing or not executable, notify the user and do not attempt alternative deployment methods.

Safety and checks:
- Ask the user to confirm (yes/no) before running the deploy script.
- Warn the user if the working tree is dirty (uncommitted changes) and ask whether to continue.
- Do not push credentials or secrets to remote; preserve existing script behavior.

Reporting:
- After the script completes, provide a concise summary: success/failure, site URL (if present in script output), and any warnings.
- Update the task tracker: create or mark a todo entry for the deploy action (e.g., "Publish site") and set it `completed` on success.

Example user phrasing the agent should match:
- "Deploy the site"
- "Publish docs to GitHub Pages"
- "Run the deploy script"

Implementation notes for the agent:
- Prefer `run_in_terminal` to execute the PowerShell command so the user sees live output.
- If the terminal call is cancelled by the user or fails locally, capture the error and present remediation steps.

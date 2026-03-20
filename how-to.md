# Runbook Documentation Workflow Guide

This repository provides a **docs-as-code workflow** for managing operational runbooks using:

- AI-assisted authoring (Copilot Agents)
- Markdown documentation
- MkDocs for the documentation site

Runbooks follow a structured lifecycle:

```
Author → Draft → Review → Categorise → Index → Publish
```

---

# 1. Prerequisites

Before creating or publishing documentation ensure the following tools are installed.

## Required Tools

- Python 3.10+
- Git
- Visual Studio Code
- GitHub Copilot with Agent support

---

## Python Environment Setup

Create the virtual environment if it does not exist.

```bash
python -m venv .venv
```

Activate the environment.

### Windows

```bash
.\.venv\Scripts\activate
```

Install dependencies.

```bash
pip install -r requirements.txt
```

---

# 2. Repository Structure Overview

The repository has three primary areas.

```
content/   → Authoring area
docs/      → MkDocs documentation source
site/      → Generated website
```

Agents operate only inside:

```
content/
```

Publishing copies content into:

```
docs/
```

---

## Runbook Locations

Draft runbooks are created in:

```
content/runbooks/drafts
```

Published runbooks live in category folders:

```
content/runbooks/<category>
```

Example:

```
content/runbooks/entity-engine/invoice-mismatches.md
```

---

# 3. Creating a New Runbook

Runbooks are created using the **runbook-author agent**.

## Step 1 — Start the Agent

In VS Code:

```
Copilot Chat → Agent Mode
```

Select the agent:

```
runbook-author
```

---

## Step 2 — Request a Runbook

Example prompt:

```
Create a runbook for resolving invoice mismatches in the entity engine.
```

The agent will guide you through structured prompts.

Typical sections include:

- Overview
- Quick triage steps
- Diagnostics
- Resolution steps
- Escalation guidance
- Communication requirements

---

## Step 3 — Draft Creation

The agent generates a Markdown draft.

Location:

```
content/runbooks/drafts/
```

Example:

```
content/runbooks/drafts/invoice-mismatches.md
```

---

# 4. Reviewing the Runbook

Before publishing, review the draft manually.

Verify:

- technical accuracy
- system references
- escalation contacts
- formatting
- clarity of instructions

Edit directly in VS Code if necessary.

---

# 5. Publishing the Runbook

Once approved, move the file to the appropriate category.

Example:

```
content/runbooks/entity-engine/
```

Result:

```
content/runbooks/entity-engine/invoice-mismatches.md
```

---

# 6. Updating Documentation Indexes

After adding a runbook to a category, update indexes.

## Run the Agent

Open Copilot Agent Mode and select:

```
docs-indexer
```

Prompt:

```
Update documentation indexes based on the content directory.
```

The agent will:

- scan the `content` directory
- detect documentation categories
- update category index pages
- update the main runbooks index

Example files updated:

```
content/runbooks/index.md
content/runbooks/entity-engine/index.md
```

---

# 7. Publishing the Documentation Site

Once indexes are updated, build and publish the site.

Run the deployment script:

```bash
powershell scripts/deploy.ps1
```

---

## What the Deploy Script Does

The script performs the following process:

```
content → docs
docs → mkdocs build
mkdocs → site
site → GitHub Pages
```

Steps executed:

1. Copy content into docs
2. Build the MkDocs site
3. Deploy to GitHub Pages
4. Validate the deployment

---

# 8. Viewing the Site

After deployment completes the site will be available at:

```
https://max-everest.github.io/platform-runbooks/
```

Allow approximately **30 seconds** for GitHub Pages to update.

---

# 9. Adding New Runbook Categories

New categories can be added simply by creating a folder.

Example:

```
content/runbooks/new-platform/
```

Add runbooks inside the folder.

Run the **docs-indexer agent** and the category will automatically appear in the documentation indexes.

---

# 10. Importing Legacy Runbooks

Legacy Excel runbooks can be converted automatically.

Place Excel files inside:

```
legacy_runbooks/
```

Run the converter script:

```bash
python scripts/convert_runbook_excel.py
```

Converted drafts will appear in:

```
content/runbooks/drafts/
```

Review and publish them using the normal workflow.

---

# 11. Complete Workflow Summary

```
runbook-author
      ↓
content/runbooks/drafts
      ↓
review
      ↓
move to category
      ↓
docs-indexer
      ↓
update index pages
      ↓
deploy.ps1
      ↓
site published
```

---

# 12. Key Rules

Always follow these guidelines:

- Draft runbooks must remain inside `drafts`
- Published runbooks belong in category folders
- Do not edit files directly inside `docs`
- Do not edit files directly inside `site`
- Always run the **docs-indexer agent** before deploying

---

# 13. Agents Used

Two agents support the documentation workflow.

## Runbook Author

Purpose:

- generate new runbooks
- follow the standard template
- store drafts

---

## Documentation Indexer

Purpose:

- maintain documentation indexes
- detect new runbooks
- ensure navigation remains organised

---

# 14. Troubleshooting

## Runbook Not Appearing on the Site

Check that:

- the runbook was moved from `drafts`
- the `docs-indexer` agent was run
- the deployment script was executed

---

## Navigation Incorrect

Run the docs-indexer agent again:

```
Update documentation indexes
```

This regenerates index pages.

---

# 15. Recommended Contributor Workflow

```
1. Create runbook with runbook-author
2. Review draft
3. Move runbook to category
4. Run docs-indexer
5. Run deploy.ps1
```

Following this process ensures the documentation site remains accurate and up to date.
# Documentation Workflow Guide

This repository provides a **docs-as-code workflow** for managing operational documentation using:

- AI-assisted authoring (Copilot Agents)
- Markdown documentation
- MkDocs for the documentation site

Documentation follows a structured lifecycle:

```
Author → Draft → Review → Promote → Index → Publish
```

The repository is intended to grow incrementally. A section can exist before it is fully populated, but draft status and review state must remain explicit throughout that journey.

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

The repository has two primary working areas.

```
content/        → Authoring and published documentation source
content/drafts/ → Shared staging area for draft items
site/           → Generated website
```

Agents operate only inside:

```
content/
```

Draft content stays inside the same source tree under the shared draft area and is excluded from published builds.

```
content/drafts/
```

---

## Documentation Locations

Draft items are created in:

```
content/drafts/
```

Published runbooks live in category folders such as:

```
content/runbooks/<category>/
```

Example:

```
content/runbooks/entity-engine/invoice-mismatches.md
```

---

# 3. Creating a New Document

Documentation can be created using the appropriate agent or manually in Markdown.

## Step 1 — Start the Agent

In VS Code:

```
Copilot Chat → Agent Mode
```

Select the appropriate agent for the document type you want to create.

---

## Step 2 — Request a Document Draft

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
content/drafts/
```

Example:

```
content/drafts/client-invoice-mismatches.md
```

Mark the document clearly as draft when it is first created.

---

# 4. Reviewing The Draft

Before publishing, review the draft manually.

Verify:

- technical accuracy
- system references
- escalation contacts
- formatting
- clarity of instructions
- draft status and document-control metadata

Edit directly in VS Code if necessary.

Keep the document marked as draft until the review explicitly approves publication.

---

# 5. Publishing The Document

Once approved, move the file to the appropriate category.

Example:

```
content/runbooks/entity-engine/
```

Result:

```
content/runbooks/entity-engine/client-invoice-mismatches.md
```

When moving the file, preserve any status markers and update them only if the reviewer has approved the status change.

---

# 6. Updating Documentation Indexes

After adding a document to a published category, update indexes.

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
- update the relevant top-level indexes

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
content → mkdocs build
mkdocs → site
site → configured hosting target
```

Steps executed:

1. Build the MkDocs site from content
2. Run the configured deployment target
3. Validate the deployment

---

# 8. Viewing the Site

After deployment completes the site will be available at the configured site URL in `mkdocs.yml`.

Allow time for the configured hosting platform to update.

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
content/drafts/
```

Review and publish them using the normal workflow.

---

# 11. Complete Workflow Summary

```
author
      ↓
content/drafts
      ↓
review
      ↓
approve status change
      ↓
move to category
      ↓
update indexes
      ↓
publish
```
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
# Repository Map

This file provides a navigation map of the repository for AI agents.

Agents must use this file to understand where documentation should be created, edited, reviewed, and published.


--------------------------------------------------

ROOT STRUCTURE

agents/
content/
contracts/
scripts/
site/


--------------------------------------------------

AGENT CONFIGURATION

Location:

agents/

Purpose:

Contains AI agent definitions, repository context, and documentation templates.

Agents should read the following files before generating documentation:

agents/context/repo-context.md
agents/context/repository-rules.md
agents/templates/runbook-template.md

These files define agent behaviour and documentation structure.


--------------------------------------------------

AUTHORING CONTENT

Location:

content/

Purpose:

This directory contains the editable documentation source used to create operational documentation.

Agents may create new documentation inside this directory.


--------------------------------------------------

SHARED DRAFT AREA

Location:

content/drafts/

Purpose:

Shared staging area for draft documentation before review and promotion.

Agents must create all new draft documents in this folder first.

Example:

content/drafts/lakehouse-refresh-failure.md


--------------------------------------------------

RUNBOOK AUTHORING

Location:

content/runbooks/

Purpose:

Contains published operational runbooks arranged by category.

Published category pattern:

content/runbooks/<category>/


--------------------------------------------------

SOPS

Location:

content/sops/

Purpose:

Standard operating procedures.


--------------------------------------------------

DATA CONTRACTS

Location:

content/data-contracts/

Purpose:

Published data interface definitions and contracts.


--------------------------------------------------

SOURCE ASSETS

Location:

contracts/

Purpose:

Stores source assets and review material that may feed published contract documentation.

The relationship between `contracts/` and `content/data-contracts/` must remain documented so draft and approval status is not lost during transformation.


--------------------------------------------------

PUBLISHED DOCUMENTATION

Location:

content/

Purpose:

Contains the documentation served by the MkDocs documentation site.

Coverage across published sections grows incrementally over time.


--------------------------------------------------

STATIC SITE OUTPUT

Location:

site/

Purpose:

Generated documentation site created by MkDocs.

This directory is automatically generated.

Agents must never modify files in this directory.


--------------------------------------------------

FILE NAMING RULES

All documentation files must use kebab-case.

Examples:

lakehouse-refresh-failure.md
pipeline-ingestion-delay.md
workday-sync-error.md


--------------------------------------------------

AGENT SAFETY RULES

Agents must follow these rules:

Create drafts only in:

content/drafts/


Never write documentation to:

site/


Never overwrite existing files without user confirmation.


Preserve draft status and visible draft markers during migration or promotion unless a reviewer explicitly approves a status change.


--------------------------------------------------

PROMOTION WORKFLOW

Draft documentation workflow:

content/drafts/example-runbook.md

↓

Review

↓

Preserve draft status until approval

↓

content/runbooks/<category>/example-runbook.md


--------------------------------------------------

END OF MAP
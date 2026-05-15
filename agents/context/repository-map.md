# Repository Map

This file provides a navigation map of the repository for AI agents.

Agents must use this file to understand where documentation should be created, edited, and published.


--------------------------------------------------

ROOT STRUCTURE

.github/
content/
site/


--------------------------------------------------

AGENT CONFIGURATION

Location:

.github/agents/

Purpose:

Contains AI agent definitions and documentation templates.

Agents should read the following files before generating documentation:

.github/agents/runbook-author.agent.md
.github/agents/runbook-template.md
.github/agents/repository-rules.md

These files define agent behaviour and documentation structure.


--------------------------------------------------

AUTHORING CONTENT

Location:

content/

Purpose:

This directory contains the editable documentation source used to create operational documentation.

Agents may create new documentation inside this directory.


--------------------------------------------------

RUNBOOK AUTHORING

Location:

content/runbooks/

Purpose:

Contains operational runbooks.


--------------------------------------------------

RUNBOOK DRAFTS

Location:

content/runbooks/drafts/

Purpose:

Temporary location for AI-generated runbook drafts.

Agents must create all new runbooks in this folder first.

Example:

content/runbooks/drafts/lakehouse-refresh-failure.md


--------------------------------------------------

RUNBOOK CATEGORIES

Approved runbook categories:

content/runbooks/data-engine
content/runbooks/entity-engine
content/runbooks/datacore
content/runbooks/fabric
content/runbooks/integrations

Once reviewed, drafts should be moved into the correct category folder.


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

Data interface definitions and contracts.


--------------------------------------------------

PUBLISHED DOCUMENTATION

Location:

content/

Purpose:

Contains the documentation served by the MkDocs documentation site.

Agents should create and modify documentation inside this directory.


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

content/runbooks/drafts/


Never write documentation to:

site/


Never overwrite existing files without user confirmation.


--------------------------------------------------

PROMOTION WORKFLOW

Draft documentation workflow:

content/runbooks/drafts/example-runbook.md

↓

Review

↓

content/runbooks/<category>/example-runbook.md


--------------------------------------------------

END OF MAP
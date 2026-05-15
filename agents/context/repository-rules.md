# Repository Rules for AI Agents

This document defines the rules that AI agents must follow when creating or modifying documentation in this repository.


--------------------------------------------------

REPOSITORY PURPOSE

This repository contains operational documentation for the Data Platform.

Documentation includes:

- runbooks
- SOPs
- data contracts
- platform documentation

Documentation is published using MkDocs.


--------------------------------------------------

DOCUMENTATION WORKFLOW

Documentation follows a controlled lifecycle.

Draft → Review → Published Documentation


AI agents generate draft documentation which must be reviewed before publication.


--------------------------------------------------

AUTHORING LOCATION

Agents must create new documentation only inside the content directory.

Example authoring paths:

content/runbooks/
content/sops/
content/data-contracts/


--------------------------------------------------

RUNBOOK DRAFT LOCATION

Runbook drafts must always be created in:

content/runbooks/drafts/


Example draft file:

content/runbooks/drafts/lakehouse-refresh-failure.md


--------------------------------------------------

RUNBOOK CATEGORY LOCATIONS

Approved runbook category locations:

content/runbooks/data-platform
content/runbooks/fabric
content/runbooks/integrations


After review, drafts may be moved to the appropriate category folder.


--------------------------------------------------

PUBLISHED DOCUMENTATION

The documentation site is generated directly from the content directory.

content/

Draft folders under content are excluded from published builds.


--------------------------------------------------

BUILD OUTPUT

The site directory contains generated documentation.

site/

This directory is generated automatically by MkDocs.

Agents must never modify files inside the site directory.


--------------------------------------------------

TEMPLATE USAGE

Documentation must follow the templates stored in:

.github/agents/


Example templates:

runbook-template.md


Agents must always use the correct template when generating documentation.


--------------------------------------------------

FILE NAMING RULES

Documentation filenames must follow kebab-case.

Examples:

lakehouse-refresh-failure.md
pipeline-ingestion-delay.md
workday-sync-error.md


--------------------------------------------------

AGENT SAFETY RULES

AI agents must follow these constraints:

Never modify:

site/


Always create drafts inside:

content/runbooks/drafts/


Never overwrite existing documentation without user confirmation.


--------------------------------------------------

PROMOTION RULE

Draft documentation should only be promoted to category folders after the user explicitly confirms the content is ready.


Example promotion:

content/runbooks/drafts/lakehouse-refresh-failure.md

→

content/runbooks/fabric/lakehouse-refresh-failure.md

Whenever documentation is created or moved into a category folder the Documentation Indexer agent must update the corresponding index.md file.
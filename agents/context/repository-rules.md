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

The repository is expected to grow incrementally. Missing content in a section should be treated as delivery backlog, not as a structural failure of the repository model.


--------------------------------------------------

AUTHORING LOCATION

Agents must create new documentation only inside the content directory.

Example authoring paths:

content/runbooks/
content/sops/
content/data-contracts/


--------------------------------------------------

SHARED DRAFT LOCATION

All new documentation drafts must be created in:

content/drafts/


Example draft file:

content/drafts/lakehouse-refresh-failure.md


--------------------------------------------------

RUNBOOK CATEGORY LOCATIONS

Published runbook category locations include:

content/runbooks/data-engine
content/runbooks/entity-engine
content/runbooks/template


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

agents/templates/


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

content/drafts/


Never overwrite existing documentation without user confirmation.


Preserve draft status, document control fields, and visible draft markers when moving or transforming documentation unless a reviewer explicitly changes the status.


--------------------------------------------------

PROMOTION RULE

Draft documentation should only be promoted to category folders after the user explicitly confirms the content is ready.


Example promotion:

content/drafts/lakehouse-refresh-failure.md

→

content/runbooks/entity-engine/lakehouse-refresh-failure.md

Whenever documentation is created or moved into a category folder the Documentation Indexer agent must update the corresponding index.md file.

Draft markers should only be removed or changed when the reviewer confirms that the document is ready for publication.
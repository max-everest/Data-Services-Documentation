# Repository Context

This repository contains operational documentation for the Data Platform including runbooks, SOPs, data contracts, reference material, and supporting documentation.

Documentation is maintained using a **docs-as-code workflow** and published as a documentation site using **MkDocs**.

AI agents are used to assist with documentation generation. All AI-generated content must follow the repository structure and publishing workflow defined in this document.


--------------------------------------------------


# Repository Purpose

The repository serves four primary purposes:

1. Provide a one-stop documentation home for the Data Services team
2. Maintain structured runbooks, SOPs, contracts, and reference material for operational teams
3. Define platform standards and support operational governance
4. Support AI-assisted documentation generation within safe repository rules

Documentation in this repository must be:

- structured
- version controlled
- reviewable
- safe for AI-assisted authoring

The repository is expected to mature incrementally. Gaps in coverage are delivery features to plan and prioritise, not evidence that the repository model is failing.


--------------------------------------------------


# Documentation Lifecycle

Documentation follows a controlled lifecycle.

Draft → Review → Published Documentation

AI agents generate documentation drafts which are reviewed before being promoted into the published documentation structure.

Documentation is published directly from the `content/` directory. Draft items must be staged in the shared draft area under `content/` and remain clearly marked as draft until they are approved.

When documentation is moved, promoted, or transformed between source assets and published pages, draft markers and status fields must be preserved unless the reviewer explicitly approves a status change.


--------------------------------------------------


# Repository Structure

agents/
    context/
    data-contract-assistant/
    templates/

content/
    drafts/
    blog/
    data-contracts/
    entity-engine/
    runbooks/
    sops/
    team/
    useful-information/

contracts/
scripts/
site/

mkdocs.yml
README.md
requirements.txt


--------------------------------------------------


# Key Repository Areas


## Agents

Location:

agents/

This folder contains AI agent instructions, repository context, and templates used to assist with documentation generation.

Templates are stored in:

agents/templates/

Agents must follow the repository rules defined in this document.


--------------------------------------------------


## Authoring Content

Location:

content/

This directory contains the source documentation used for authoring and publishing.

Published material remains in its subject area under `content/`. Draft material is staged in the shared draft area before promotion.

Subfolders include:

content/blog
content/data-contracts
content/entity-engine
content/runbooks
content/sops
content/team
content/useful-information


--------------------------------------------------


## Draft Content

Location:

content/drafts/

New draft items should be staged in this shared draft area before they are promoted into their final published location.

Example:

content/drafts/client-invoice-readiness.md

Draft content must remain clearly marked as draft while under review.


--------------------------------------------------


## Published Documentation

Location:

content/

The `content/` directory contains the documentation published by MkDocs.

Typical published areas include:

content/runbooks
content/sops
content/data-contracts
content/entity-engine
content/team
content/useful-information

Coverage across these areas is expected to expand incrementally over time.


--------------------------------------------------


## Contracts And Source Assets

Locations:

contracts/
content/data-contracts/

Contract source assets and published contract documentation must have a documented relationship so contributors understand which source is authoritative and how status is carried through promotion or transformation.


--------------------------------------------------


# Build Output

Location:

site/

The `site/` directory contains the generated static website created by MkDocs.

This directory is generated automatically during the documentation build process.

Agents must never modify files inside the `site/` directory.


--------------------------------------------------


# Documentation Templates

Templates are stored in:

agents/templates/

Example:

runbook-template.md

Templates define the required structure for documentation types.

Agents must use the appropriate template when generating documentation.


--------------------------------------------------


# Content Promotion Rules

Agents must follow these rules:

1. Draft documentation must be created inside the shared draft area under `content/`.
2. Agents must never write directly into `site/`.
3. Documentation must follow the defined template structure.
4. Drafts must be reviewed before being promoted to the final location.
5. Draft status, document-control fields, and any visible draft markers must be preserved during moves or transformations unless a reviewer explicitly changes the status.
6. Missing content in a published area should be treated as delivery backlog, not as a blocker to the repository model.


--------------------------------------------------


# Safety Rules for AI Agents

AI agents must follow these constraints:

Never modify:

site/

Always create new draft documents in the shared draft area under `content/`.

Only move documentation into published folders after user confirmation.

Agents must not overwrite existing documentation without explicit user instruction.
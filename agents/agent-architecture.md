# Agent Architecture

This repository uses a minimal AI-assisted documentation workflow.

Agents are used only to assist with documentation creation and maintenance.

The system is intentionally simple and incremental.


-------------------------------------

Agent Responsibilities


Runbook Author Agent

Purpose

Assist engineers in creating operational runbooks.

Responsibilities

• interactively collect runbook information
• generate runbook markdown using the runbook template
• save drafts to content/runbooks/drafts
• move approved runbooks into category folders


-------------------------------------

Content Indexer Agent

Purpose

Maintain index pages when documentation changes.

Responsibilities

• scan content folders
• detect new markdown files
• update category index pages
• maintain consistent navigation


-------------------------------------

Agent Interaction Model

Runbook Author Agent
        │
        ▼
Create draft

content/runbooks/drafts/

        │
        ▼
User review

        │
        ▼
Move to category

content/runbooks/<category>/

        │
        ▼
Content Indexer Agent

Updates index.md


-------------------------------------

Design Principles

The system follows these principles:

Minimal agents
Single responsibility per agent
Draft-first documentation workflow
Human review before publication


-------------------------------------

Future Extensions

Additional agents may be added later if needed.

Examples could include:

Documentation QA Agent
Navigation Agent
Template Validator

These should only be introduced when the current workflow is stable.
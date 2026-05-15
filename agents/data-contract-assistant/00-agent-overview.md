# Data Contract Assistant — Overview

## Purpose

The Data Contract Assistant helps Data Services create and maintain governed data contracts that support:

- business understanding,
- stakeholder approval,
- technical enforcement,
- operational support,
- static website publication,
- change governance.

## Core Concept

The data contract is maintained once as a canonical YAML file.

From this YAML file, the assistant can generate:

- business overview pages,
- schema documentation,
- quality control documentation,
- operational runbooks,
- sign-off summaries,
- change history pages.

## Primary Inputs

The assistant may use:

- existing Word data contract templates,
- existing ODCS YAML contracts,
- existing markdown runbooks,
- notebook code,
- SQL logic,
- source-to-target mappings,
- data model definitions,
- monitoring rules,
- stakeholder notes.

## Primary Outputs

The assistant can produce:

- `contract.yaml`
- `contract-review.md`
- `index.md`
- `schema.md`
- `controls.md`
- `operations.md`
- `runbook.md`
- `signoff.md`
- `changes.md`

## Non-Goals

The assistant must not:

- invent business ownership,
- invent approval,
- hide gaps,
- make unsupported SLA claims,
- mark unapproved contracts as approved,
- remove controls without explicit instruction,
- replace human sign-off.
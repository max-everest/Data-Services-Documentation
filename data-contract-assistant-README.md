# Data Contract Assistant — User Guide

## Purpose

The Data Contract Assistant helps Data Services create, align, validate, and publish governed data contracts.

It is designed to support a docs-as-code operating model where the data contract is maintained as a structured source file and then used to generate business, technical, operational, and governance documentation.

The assistant supports the creation and maintenance of:

- canonical `contract.yaml` files,
- business-facing contract overview pages,
- schema and field definition pages,
- data quality and control pages,
- operational runbooks,
- change history pages,
- sign-off summaries,
- contract review and gap analysis outputs.

The assistant should be treated as a controlled contract generation and review helper, not as an automatic approver.

---

## Core Principle

A data contract is not just a document.

It is a governed, version-controlled specification that can be:

1. rendered as documentation,
2. enforced as technical validation,
3. used to support operations,
4. reviewed by business and technical owners,
5. published through a static documentation site.

The intended model is:

```text
contract.yaml
   ├── generates index.md
   ├── generates schema.md
   ├── generates controls.md
   ├── generates operations.md
   ├── generates runbook.md
   ├── generates changes.md
   └── supports optional signoff.md / Word / PDF snapshot
```

---

## How to Use the Agent

The agent works best when you give it a clear task, the available source artefacts, and the output you want.

A good interaction normally follows this pattern:

```text
1. Tell the agent what data product or process you are documenting.
2. Provide any existing artefacts.
3. Ask the agent to review and produce a gap analysis first.
4. Confirm or answer material gaps.
5. Ask the agent to generate or update the contract artefacts.
6. Review the output before approval or publication.
```

Do not start by asking the agent to create the final documentation immediately. Ask it to review, structure, and identify gaps first.

Recommended first prompt:

```markdown
You are the Data Contract Assistant.

I want to create or align a data contract using our standard model.

Use the available artefacts to:

1. Review what information exists.
2. Map the information into the canonical contract model.
3. Identify gaps by section.
4. Produce a draft `contract.yaml`.
5. Generate website-ready markdown pages:
   - `index.md`
   - `schema.md`
   - `controls.md`
   - `operations.md`
6. Generate a `contract-review.md`.
7. Do not mark the contract as approved or active unless explicitly told to.
8. Use `TBC` for missing information.
9. Preserve ODCS-compatible structure.
10. Highlight any content that requires Data Owner, Business Owner, Data Architect, SME or Support Owner confirmation.

Start by producing the source review and gap analysis before generating the final artefacts.
```

---

## What to Provide to the Agent

The assistant can work from partial information, but the quality of the output depends on the quality of the source material.

Useful inputs include:

| Input | Why it helps |
|---|---|
| Existing Word contract template | Provides business purpose, scope, RACI, sign-off and governance context |
| Existing ODCS YAML contract | Provides schema, quality rules, SLA properties and Fabric enforcement structure |
| Existing runbook markdown | Provides operational support, triage, diagnostics and escalation content |
| Notebook code | Helps identify source tables, target tables, transformations, quality checks and dependencies |
| SQL logic | Helps extract filters, joins, derivations and validation rules |
| Source-to-target mapping | Helps generate schema and lineage sections |
| Monitoring or alert rules | Helps generate operations and runbook content |
| Stakeholder notes | Helps capture purpose, usage, limitations and ownership |
| Existing MkDocs pages | Helps align generated documentation to the static website style |

The agent can still begin if only one or two artefacts are available. It should mark missing information as `TBC` and list known gaps.

---

## What to Expect from the Agent

The assistant should normally produce outputs in this order:

1. `contract-review.md`
2. `contract.yaml`
3. `index.md`
4. `schema.md`
5. `controls.md`
6. `operations.md`
7. `runbook.md`
8. `changes.md`
9. `signoff.md`

The agent should not always generate every file. It should generate only what is appropriate for the maturity level and information available.

---

## Agent Modes

The assistant is designed around clear working modes. You can explicitly ask it to use one of these modes.

### 1. Discovery Mode

Use when starting with limited information.

Expected output:

- intake summary,
- known facts,
- assumptions,
- missing information,
- questions grouped by audience,
- recommended next step.

Example prompt:

```markdown
Use Discovery Mode for this data product. Review the available notes and tell me what information we have, what is missing, and what questions need to be answered before we create the contract.
```

---

### 2. Contract Modelling Mode

Use when creating or updating the canonical `contract.yaml`.

Expected output:

- summary of proposed changes,
- draft or updated YAML,
- known gaps,
- questions requiring confirmation.

Example prompt:

```markdown
Use Contract Modelling Mode. Take the existing YAML and enrich it using the supplied business template and runbook. Preserve valid ODCS fields and use `TBC` where information is missing.
```

---

### 3. Technical Enrichment Mode

Use when analysing notebooks, SQL, pipelines, or data engineering logic.

Expected output:

- extracted technical facts,
- proposed contract updates,
- YAML patch,
- technical risks or questions.

Example prompt:

```markdown
Use Technical Enrichment Mode. Review this notebook and extract the source tables, target tables, joins, filters, dependencies, parameters, and quality checks that should be added to the contract.
```

---

### 4. Quality Rule Design Mode

Use when defining or improving data quality rules.

Expected output:

- required rules,
- recommended rules,
- optional observability metrics,
- proposed YAML quality section,
- questions for the Data Owner or SME.

Example prompt:

```markdown
Use Quality Rule Design Mode. Based on this schema and business purpose, propose completeness, uniqueness, validity, accuracy, consistency, timeliness and integrity rules.
```

---

### 5. Runbook Mode

Use when creating operational support documentation.

Expected output:

- complete `runbook.md`,
- triage table,
- diagnostics,
- escalation model,
- communication templates,
- recovery validation checks,
- operational gaps.

Example prompt:

```markdown
Use Runbook Mode. Generate an operational runbook from the contract. Include quick triage, diagnostics, escalation, communication templates and recovery validation.
```

---

### 6. Documentation Generation Mode

Use when generating website-ready markdown from the contract.

Expected output:

- `index.md`,
- `schema.md`,
- `controls.md`,
- `operations.md`,
- `changes.md`.

Example prompt:

```markdown
Use Documentation Generation Mode. Generate MkDocs-ready markdown pages from this `contract.yaml`. Keep the overview business-readable and put technical detail in the schema and controls pages.
```

---

### 7. Review & Gap Analysis Mode

Use when checking completeness and readiness.

Expected output:

- readiness assessment,
- findings by severity,
- required actions before approval,
- suggested improvements.

Example prompt:

```markdown
Use Review & Gap Analysis Mode. Review this contract for business, technical, quality, operational, governance and website readiness. Categorise findings as Critical, High, Medium, Low or Suggestion.
```

---

### 8. Change Management Mode

Use when assessing changes to an existing contract.

Expected output:

- change classification,
- impact assessment,
- approval requirements,
- YAML patch,
- documentation updates required.

Example prompt:

```markdown
Use Change Management Mode. Assess this proposed change to the contract. Tell me whether it is a defect, operational change, enhancement, breaking change, non-breaking change or documentation-only change.
```

---

## Contract Maturity Levels

The agent uses maturity levels to avoid over-documenting early-stage work.

| Level | Name | Purpose |
|---|---|---|
| Level 0 | Catalogue | Basic record for discovery |
| Level 1 | Business Contract | Suitable for business review |
| Level 2 | Technical Contract | Suitable for engineering build |
| Level 3 | Operational Contract | Suitable for production support |
| Level 4 | Audit-Ready Contract | Suitable for formal governance, review and audit |

When using the agent, tell it the target maturity level where possible.

Example:

```markdown
Create a Level 2 Technical Contract from the supplied YAML and notebook. Identify what is missing for Level 3 Operational Contract readiness.
```

---

## Human Approval Gates

The agent must not approve contracts by itself.

Human approval is required before:

1. setting a contract status to `approved`,
2. setting a contract status to `active`,
3. changing ownership,
4. changing SLA values,
5. changing severity levels,
6. removing a quality rule,
7. removing a critical data element,
8. changing source or target definitions,
9. changing support routing,
10. publishing production documentation,
11. creating a formal sign-off artefact.

The agent should clearly flag where approval is required.

---

## Recommended Repository Layout

A typical repository structure is:

```text
.github/
  agents/
    data-contract-assistant.agent.md

agents/
  data-contract-assistant/
    00-agent-overview.md
    01-contract-model.md
    02-question-bank.md
    03-yaml-style-guide.md
    04-markdown-style-guide.md
    05-quality-rule-guide.md
    06-runbook-guide.md
    07-review-checklist.md
    08-generation-workflow.md
    09-human-approval-rules.md
    10-output-examples.md

contracts/
  gold/
    example_data_product/
      contract.yaml
      contract-review.md

content/
  data-contracts/
    gold/
      example-data-product/
        index.md
        schema.md
        controls.md
        operations.md
        runbook.md
        changes.md

templates/
  data-contract/
    index.md.j2
    schema.md.j2
    controls.md.j2
    operations.md.j2
    changes.md.j2
    runbook.md.j2
    signoff.md.j2

schemas/
  organisation-data-contract.schema.json

tools/
  validate_contract.py
  generate_contract_docs.py
```

In a MkDocs repository, generated contract pages should live under the authored documentation tree, for example `content/data-contracts/...`, and draft pages should remain under draft folders until they are ready to publish.

---

## Recommended Working Pattern

### Starting a new contract

Use this flow:

```text
Discovery Mode
   ↓
Contract Modelling Mode
   ↓
Review & Gap Analysis Mode
   ↓
Quality Rule Design Mode
   ↓
Documentation Generation Mode
   ↓
Runbook Mode
   ↓
Human approval
   ↓
Publish
```

### Updating an existing contract

Use this flow:

```text
Change Management Mode
   ↓
Impact assessment
   ↓
YAML patch
   ↓
Documentation update
   ↓
Review & approval
```

### Converting a Word template

Use this flow:

```text
Source review
   ↓
Extract structured facts
   ↓
Map to canonical YAML
   ↓
Identify gaps
   ↓
Generate markdown views
```

### Enriching an ODCS YAML file

Use this flow:

```text
Preserve ODCS structure
   ↓
Add organisation extensions
   ↓
Add ownership and governance
   ↓
Add monitoring and runbook metadata
   ↓
Generate documentation
```

---

## Good Prompt Examples

### Review existing files

```markdown
Review these data contract artefacts and produce a structured gap analysis. Compare the current content against our standard contract model and tell me what is missing for Level 3 Operational Contract readiness.
```

### Generate YAML

```markdown
Create a draft `contract.yaml` from the available artefacts. Preserve ODCS-compatible fields, add organisation-specific sections where needed, and use `TBC` for unknown values. Do not mark the contract as approved or active.
```

### Generate website pages

```markdown
Generate MkDocs-ready documentation from this contract. Create `index.md`, `schema.md`, `controls.md`, `operations.md` and `changes.md`. Keep the overview suitable for business stakeholders and put technical detail into the relevant child pages.
```

### Review quality rules

```markdown
Review the quality rules in this contract. Tell me whether each rule is testable, whether the severity is appropriate, whether the business impact is clear, and whether any critical data elements are missing controls.
```

### Generate a runbook

```markdown
Generate an operational runbook from this contract. Include overview, severity, ownership, quick triage, diagnostics, escalation, communication templates, recovery validation and references.
```

### Assess a change

```markdown
Assess this proposed contract change. Classify it as defect, operations, enhancement, breaking change, non-breaking change or documentation-only. Identify required approvals and produce the YAML/documentation changes required.
```

---

## Bad Prompt Examples

Avoid prompts like:

```markdown
Write me a data contract.
```

```markdown
Make this look better.
```

```markdown
Approve this contract.
```

```markdown
Update everything.
```

These are too vague and increase the risk of inconsistent or unsupported output.

Instead, ask for a specific mode, a specific artefact, and a specific readiness level.

---

## Expected Agent Behaviour

The agent should:

- preserve existing valid content,
- avoid inventing ownership or approval,
- use `TBC` for unknowns,
- identify gaps explicitly,
- separate facts from assumptions,
- generate structured, reviewable output,
- use consistent file names,
- produce website-ready markdown,
- protect human approval gates,
- explain what still needs review.

The agent should not:

- silently remove controls,
- mark a contract as active without instruction,
- invent SLA values,
- invent support routes,
- hide missing information,
- convert everything into free text,
- duplicate facts across manually maintained documents,
- treat Word as the source of truth.

---

## What a Good Output Looks Like

A good agent response should normally include:

```text
1. Summary of what was reviewed
2. Assumptions made
3. Known gaps
4. Proposed contract structure or patch
5. Generated artefacts
6. Approval points
7. Next recommended action
```

For example:

```markdown
## Summary

I reviewed the supplied YAML and runbook. The YAML contains schema, quality rules and SLA properties, but the ownership, monitoring and escalation sections are incomplete.

## Known Gaps

| Gap | Impact | Owner |
|---|---|---|
| Data Owner is TBC | Business approval cannot be completed | Business Owner |
| Support channel is missing | Operational runbook cannot be finalised | Support Owner |

## Proposed Next Step

Confirm the Data Owner, Support Owner, refresh SLA and monitoring channel before marking this as Level 3 ready.
```

---

## File Naming Standards

Use these names unless there is a clear reason not to:

| File | Purpose |
|---|---|
| `contract.yaml` | Canonical source of truth |
| `contract-review.md` | Review and gap analysis |
| `index.md` | Business overview |
| `schema.md` | Schema and field definitions |
| `controls.md` | Quality rules, controls and SLAs |
| `operations.md` | Monitoring, alerting and support model |
| `runbook.md` | Operational support runbook |
| `changes.md` | Version and approval history |
| `signoff.md` | Approval summary |

---

## Review Checklist Before Publishing

Before publishing generated content, check:

- [ ] Contract status is correct.
- [ ] Data owner is defined.
- [ ] Technical owner is defined.
- [ ] Support owner is defined.
- [ ] Source systems are defined.
- [ ] Target location is defined.
- [ ] Schema fields have descriptions.
- [ ] Critical data elements are marked.
- [ ] Quality rules are testable.
- [ ] Quality rules have severities.
- [ ] SLAs are explicit.
- [ ] Monitoring signals are actionable.
- [ ] Runbook diagnostics are usable.
- [ ] Escalation route is defined.
- [ ] Known gaps are visible.
- [ ] Approval requirements are clear.
- [ ] MkDocs links work.

---

## Suggested First Task for a New User

Start with this request:

```markdown
Use Discovery Mode to review the available artefacts for this data product. Produce a source review, gap analysis and a recommended plan to create a Level 2 Technical Contract and identify what is missing for Level 3 Operational readiness.
```

This gives the agent enough structure to produce useful work without prematurely generating a final document.

---

## Final Reminder

The assistant accelerates contract creation, but accountability remains with the relevant owners.

Use the agent to structure, validate, generate and review.

Use human approval to confirm business meaning, ownership, SLA, severity, support model and production readiness.

# Data Contract Model

## Purpose

This guide defines the canonical structure for data contracts used by the Data Services function.

The contract model is designed so that a single `contract.yaml` file can support:

- business-facing documentation,
- technical enforcement in Microsoft Fabric,
- operational runbooks,
- governance and approval,
- static website publication.

## Canonical Contract Structure

A contract should use this high-level structure:

```yaml
apiVersion: v3.1.0
kind: DataContract

id:
name:
version:
status:
domain:
dataProduct:
classification:

description:
  purpose:
  businessProblem:
  usage:
  limitations:
  inScope:
  outOfScope:
  successMeasures: []

ownership:
  productOwner:
  businessOwner:
  dataOwner:
  dataArchitect:
  sourceSme:
  technicalOwner:
  supportOwner:

approval:
  status:
  approvers: []
  approvalHistory: []

changeManagement:
  defaultProcess:
  changeTypes: []

servers: []

sources: []

targets: []

lineage:
  upstream: []
  downstream: []

processing:
  trigger:
  schedule:
  expectedDurationMinutes:
  cutoffMinutes:
  functionalFlow: []
  variables: []
  filteringRules: []
  joinsAndLookups: []
  derivations: []
  validations: []
  businessRules: []
  dependencies: []

schema: []

slaProperties: []

monitoring:
  signals: []
  alertPolicy: []
  dashboard:
  evidenceLocation:

support: []

runbook:
  whenToUse:
  severityModel:
  triage: []
  diagnostics: []
  escalation: []
  communication: []
  references: []

glossary: []

references: []

customProperties: []
```

---

## Section Rules

### Identity

Required for all maturity levels.

Fields:

- `id`
- `name`
- `version`
- `status`
- `domain`
- `dataProduct`

Use `active` only where the contract has been approved for production use.

Recommended statuses:

| Status | Meaning |
|---|---|
| `draft` | Initial working version |
| `in_review` | Under business, technical, or governance review |
| `approved` | Approved but not necessarily live |
| `active` | Approved and in production use |
| `deprecated` | Still available but no longer preferred |
| `retired` | No longer in use |

---

### Description

The `description` section should be business-readable.

It must explain:

- what the data product is,
- why it exists,
- what business problem it solves,
- how it should be used,
- what limitations apply,
- what is in scope,
- what is explicitly out of scope.

Example:

```yaml
description:
  purpose: >
    Provides a trusted Gold-layer dataset of daily utilisation actuals per employee and date.
    The product supports workforce utilisation reporting, billing reconciliation and
    resource-level KPI dashboards.
  businessProblem: >
    Business teams need a consistent and governed source of utilisation actuals rather than
    relying on multiple local extracts and inconsistent reporting logic.
  usage: >
    Use this data product for approved utilisation reporting, operational trend analysis and
    reconciliation against agreed workforce metrics.
  limitations:
    - Does not provide forecast utilisation.
    - Does not replace source system transactional audit records.
  inScope:
    - Daily utilisation actuals.
    - Employee and date-level utilisation measures.
  outOfScope:
    - Forecast utilisation.
    - Manual adjustments not present in the approved source process.
```

---

### Ownership

The `ownership` section identifies accountable roles.

Do not use only team names where an accountable owner is required.

Recommended fields:

| Field | Purpose |
|---|---|
| `productOwner` | Owns the business value and prioritisation |
| `businessOwner` | Owns business process outcomes |
| `dataOwner` | Owns data meaning, rules and usage approval |
| `dataArchitect` | Owns architectural alignment and design standards |
| `sourceSme` | Provides source system interpretation |
| `technicalOwner` | Owns technical implementation |
| `supportOwner` | Owns operational support and incident response |

Example:

```yaml
ownership:
  productOwner: TBC
  businessOwner: TBC
  dataOwner: TBC
  dataArchitect: TBC
  sourceSme: TBC
  technicalOwner: data-engineering
  supportOwner: data-engineering
```

---

### Approval

Approval is not assumed.

The assistant must not mark a contract as approved or active unless explicitly instructed.

Example:

```yaml
approval:
  status: draft
  approvers:
    - role: Data Owner
      name: TBC
      required: true
      status: pending
    - role: Data Architect
      name: TBC
      required: true
      status: pending
  approvalHistory: []
```

---

### Change Management

The `changeManagement` section defines how changes are classified and governed.

Recommended change types:

| Change Type | Description |
|---|---|
| `defect` | Process failure, error, or operation outside agreed parameters |
| `operations` | Required platform, access, dependency, or maintenance change |
| `enhancement` | New or amended business capability requiring prioritisation |
| `breaking_change` | Change that may break downstream consumers |
| `documentation_only` | Change to documentation with no process or control impact |

Example:

```yaml
changeManagement:
  defaultProcess: devops_change
  changeTypes:
    - type: defect
      description: Process failure, error, or operation outside agreed parameters.
      approvalRequired: false
    - type: operations
      description: Required platform, access, dependency, or maintenance change.
      approvalRequired: conditional
    - type: enhancement
      description: New or amended business capability requiring prioritisation.
      approvalRequired: true
```

---

### Servers

The `servers` section should preserve ODCS-compatible platform/server definitions where applicable.

Use this section to describe where the data product physically exists.

Example:

```yaml
servers:
  - server: fabric_lakehouse
    type: microsoft-fabric
    environment: production
    workspace: financial_data_hub
    lakehouse: financial_data_hub
    path: Tables/gold/utilisation_actual
```

---

### Sources

Each source should include:

- name,
- system,
- owner,
- connection pattern,
- dataset/table/view/API endpoint,
- refresh pattern,
- access/security notes.

Example:

```yaml
sources:
  - name: productive_time_source
    system: PASO
    owner: TBC
    connection: mirrored_database
    dataset: dbo.ProductiveTime
    refresh: near_real_time
    accessPattern: managed_identity
    securityNotes: Source access controlled through approved platform credentials.
```

---

### Targets

Each target should include:

- name,
- platform,
- schema/path,
- format,
- consumers,
- access model.

Example:

```yaml
targets:
  - name: gold.utilisation_actual
    platform: Microsoft Fabric
    path: Tables/gold/utilisation_actual
    format: delta
    consumers:
      - workforce utilisation reporting
      - billing reconciliation
    accessModel: Fabric workspace and downstream semantic model permissions
```

---

### Lineage

The `lineage` section should capture meaningful upstream and downstream dependencies.

Example:

```yaml
lineage:
  upstream:
    - silver.dim_date
    - silver.employee
    - silver.productive_time
  downstream:
    - Power BI utilisation dashboard
    - workforce KPI reporting
```

---

### Processing

The `processing` section describes how the data product is created and maintained.

It should cover:

- trigger,
- schedule,
- expected duration,
- cutoff logic,
- functional flow,
- variables,
- filters,
- joins and lookups,
- derivations,
- validations,
- business rules,
- dependencies.

Example:

```yaml
processing:
  trigger: scheduled
  schedule: "0 2 * * *"
  expectedDurationMinutes: 30
  cutoffMinutes: 60
  functionalFlow:
    - step: Read source views from the curated layer.
    - step: Apply agreed business filters and effective-dated logic.
    - step: Calculate utilisation measures.
    - step: Write the Gold Delta table.
  variables:
    - name: run_date
      description: Processing date used for date-effective logic.
  filteringRules:
    - id: exclude_inactive_records
      description: Exclude records not active under the agreed source status definition.
  joinsAndLookups:
    - id: employee_lookup
      description: Enrich utilisation records with employee attributes.
  derivations:
    - id: utilisation_percentage
      description: Calculate utilisation percentage from actual and standard hours.
  validations:
    - id: row_count_positive
      description: Target table must contain at least one row after processing.
  businessRules:
    - id: approved_employee_population
      description: Include only employees within the approved reporting population.
  dependencies:
    - name: silver.dim_date
      type: table
      required: true
```

---

### Schema

Each field should include:

- name,
- description,
- logical type,
- physical type,
- required flag,
- critical data element flag.

Recommended optional fields:

- source field,
- business definition,
- transformation logic,
- allowed values,
- example,
- data classification,
- owner.

Example:

```yaml
schema:
  - name: ContactID
    description: Unique identifier for the employee or contact record used in utilisation reporting.
    logicalType: string
    physicalType: string
    required: true
    criticalDataElement: true
    sourceField: source.ContactID
    businessDefinition: Identifies the person associated with the utilisation record.
    transformationLogic: Passed through from the trusted source layer.
    example: "123456"
    dataClassification: internal
    owner: data-owner
```

---

### Critical Data Elements

A critical data element is a field that materially affects:

- business trust,
- downstream processing,
- financial reporting,
- regulatory reporting,
- operational decision-making,
- service performance.

Critical data elements should normally have associated quality rules.

Example:

```yaml
schema:
  - name: ContactID
    required: true
    criticalDataElement: true
```

---

### Quality Rules

Quality rules should be specific, testable and owned.

Each rule should include:

- rule ID,
- description,
- dimension,
- severity,
- type,
- target,
- expected outcome,
- owner,
- evidence location where possible.

Allowed dimensions:

- completeness,
- uniqueness,
- validity,
- accuracy,
- consistency,
- timeliness,
- integrity.

Allowed severities:

| Severity | Meaning |
|---|---|
| `error` | Fails the contract and should stop or quarantine processing |
| `warning` | Allows processing but requires review |
| `information` | Captured for observability or trend monitoring |

Library rule example:

```yaml
quality:
  - rule: contact_id_not_null
    description: Every row must have a non-null ContactID value.
    dimension: completeness
    severity: error
    type: library
    metric: nullValues
    column: ContactID
    mustBe: 0
    owner: data-engineering
    evidence: audit.data_quality_results
```

SQL rule example:

```yaml
quality:
  - rule: standard_hours_range
    description: StandardHours must be between 0 and 24 for every row.
    dimension: accuracy
    severity: error
    type: sql
    query: >
      SELECT COUNT(*)
      FROM gold.utilisation_actual
      WHERE StandardHours < 0 OR StandardHours > 24
    mustBe: 0
    owner: data-engineering
    evidence: audit.data_quality_results
```

---

### SLA Properties

Use `slaProperties` for measurable service expectations.

Recommended SLA types:

- refresh frequency,
- latency,
- retention,
- availability,
- support response,
- recovery expectations.

Example:

```yaml
slaProperties:
  - property: refresh_frequency
    value: 1
    unit: day
    element: gold.utilisation_actual
    description: Data should be refreshed daily.
  - property: latency
    value: 4
    unit: hour
    element: gold.utilisation_actual
    description: Data should be available within 4 hours of upstream readiness.
  - property: retention
    value: 7
    unit: year
    element: gold.utilisation_actual
    description: Data should be retained for seven years unless superseded by policy.
```

---

### Monitoring

Monitoring should describe:

- signal,
- condition,
- threshold,
- severity,
- channel,
- owner,
- auto-remediation if any.

Example:

```yaml
monitoring:
  signals:
    - id: freshness_breach
      description: Data has not refreshed within the agreed SLA.
      condition: latest_successful_run older than expected threshold
      threshold: 4h
      severity: P2
      channel: ServiceNow
      owner: data-engineering
      autoRemediation: Retry pipeline once after 15 minutes.
  alertPolicy:
    - condition: Data quality error rule failed
      threshold: any error severity failure
      channel: ServiceNow
      priority: P2
      autoRemediation: No automatic remediation unless explicitly configured.
  dashboard: TBC
  evidenceLocation: audit.data_quality_results
```

---

### Support

The `support` section should describe how issues are raised and who responds.

Example:

```yaml
support:
  - channel: data-engineering
    tool: teams
    scope: triage and operational support
  - channel: ServiceNow
    tool: itsm
    scope: production incidents and formal service management
```

---

### Runbook

Runbook content should be concise and operational.

It should include:

- when to use,
- triage,
- diagnostics,
- escalation,
- communication,
- references.

Example:

```yaml
runbook:
  whenToUse: Use this runbook when the utilisation actuals table fails to refresh or breaches quality controls.
  severityModel: standard-data-service
  triage:
    - issue: Freshness breach
      symptom: Data older than agreed SLA.
      action: Check latest pipeline run and upstream dependency status.
  diagnostics:
    - id: check_latest_run
      name: Check latest successful run
      type: sql
      query: >
        SELECT MAX(run_completed_at) AS latest_successful_run
        FROM audit.pipeline_runs
        WHERE data_product = 'gold_utilisation_actual'
      expectedResult: Latest successful run is within SLA.
  escalation:
    - scenario: Repeated failed runs
      escalateTo: Data Owner and Technical Owner
      criteria: More than one failed production run in the current business day.
  communication:
    - audience: Data Owner
      phase: Investigation
      message: The utilisation actuals data product has raised an alert and is being investigated.
      channel: Email
  references:
    - name: Monitoring Dashboard
      url: TBC
```

---

### Glossary

Use `glossary` to define terms that help business and support users understand the contract.

Example:

```yaml
glossary:
  - term: Utilisation Actuals
    definition: Actual recorded utilisation based on processed source activity rather than forecast or planned activity.
  - term: Critical Data Element
    definition: A field that materially affects business trust, downstream processing or reporting.
```

---

### References

Use `references` for links to supporting artefacts.

Examples:

- notebooks,
- pipelines,
- dashboards,
- DevOps items,
- Miro boards,
- source system documentation,
- implementation SQL,
- published static site pages.

Example:

```yaml
references:
  - name: Fabric Notebook
    type: notebook
    url: TBC
  - name: Monitoring Dashboard
    type: dashboard
    url: TBC
  - name: Miro Design Board
    type: design
    url: TBC
```

---

### Custom Properties

Use `customProperties` only when there is no suitable native field.

Good use:

```yaml
customProperties:
  - property: upstreamDependency
    value:
      table: silver.dim_date
      stalenessCheck: existence
      minRowCount: 1
```

Poor use:

```yaml
customProperties:
  - property: notes
    value: Lots of unstructured text that should be in a markdown design document.
```

---

## Maturity Levels

### Level 0 — Catalogue

Minimum discovery record.

Required:

- name,
- domain,
- data product,
- purpose,
- owner,
- status.

### Level 1 — Business Contract

Suitable for business review.

Required:

- purpose,
- business problem,
- scope,
- out of scope,
- ownership,
- source systems,
- target consumers,
- success measures,
- known limitations.

### Level 2 — Technical Contract

Suitable for engineering build.

Required:

- schema,
- physical types,
- required fields,
- critical data elements,
- quality rules,
- dependencies,
- processing logic,
- platform location.

### Level 3 — Operational Contract

Suitable for production support.

Required:

- SLAs,
- monitoring signals,
- alert routing,
- support owner,
- diagnostics,
- escalation,
- runbook,
- evidence location.

### Level 4 — Audit-Ready Contract

Suitable for formal governance or audit.

Required:

- approval records,
- version history,
- evidence records,
- control ownership,
- review cadence,
- sign-off artefact,
- change history.

---

## Validation Checklist

Before a contract is considered ready, check the following.

### Business Readiness

- Purpose is clear.
- Business problem is stated.
- In-scope and out-of-scope items are explicit.
- Intended usage is clear.
- Known limitations are stated.
- Success measures are measurable.
- Business owner is defined.
- Data owner is defined.
- SME is defined.
- Consumers are identified.

### Technical Readiness

- Fabric location is defined.
- Source systems are identified.
- Target table or path is identified.
- Schema is complete.
- Field descriptions are business-readable.
- Required fields are marked.
- Critical data elements are marked.
- Data types are defined.
- Business rules are captured.
- Transformations are described.
- Dependencies are listed.

### Quality Readiness

- Quality rules exist.
- Each rule has a severity.
- Each rule has an owner.
- Each rule is testable.
- Critical data elements have checks.
- Freshness or latency is covered.
- Reconciliation is covered where possible.
- Warning versus error rules are justified.

### Operational Readiness

- Refresh SLA is defined.
- Latency SLA is defined.
- Expected duration is defined.
- Cutoff logic is defined.
- Monitoring signals exist.
- Alert policy is defined.
- Support channel is defined.
- Diagnostics are actionable.
- Escalation path is defined.
- Recovery validation exists.

### Governance Readiness

- Approval status is correct.
- Approvers are listed.
- Change process is defined.
- Version history is present.
- Review cadence is present.
- Sign-off status is explicit.

### Website Readiness

- Overview page can be generated.
- Schema page can be generated.
- Controls page can be generated.
- Operations page can be generated.
- Broken links are not present.
- `TBC` values are listed in Known Gaps.

---

## Anti-Patterns

Avoid these patterns:

| Anti-Pattern | Why It Is a Problem |
|---|---|
| Word document as source of truth | Becomes stale and cannot enforce controls |
| YAML full of long prose | Hard to validate and hard to use in notebooks |
| Markdown manually duplicating YAML | Creates drift |
| Missing owner fields | Blocks approval and change governance |
| Quality rules without severity | Support impact is unclear |
| Quality rules without owners | No accountable party for failures |
| Critical fields without checks | Contract does not enforce what matters |
| Active status without approval | Creates false governance confidence |
| Operational runbook disconnected from contract | Support procedures become stale |
| Free-text source/target descriptions only | Prevents automation and lineage generation |

---

## Design Principle

The contract should be maintained once, then rendered many ways:

```text
contract.yaml
  ├── index.md
  ├── schema.md
  ├── controls.md
  ├── operations.md
  ├── runbook.md
  ├── changes.md
  └── signoff.md / pdf / docx
```

The assistant should behave like a controlled contract compiler, not a free-form document writer.
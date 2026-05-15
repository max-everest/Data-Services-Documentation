# Contract Review: Workday Supplier Invoice

## Intake Summary

| Item | Value |
|---|---|
| Data Product | Workday Supplier Invoice |
| Contract Status | Draft |
| Target Maturity Level | Level 3 - Operational Contract |
| Available Inputs | Supplied SQL entity definition; existing client-invoice artefacts; manually updated contract.yaml |
| Requested Outputs | contract.yaml, index.md, schema.md, controls.md, operations.md, contract-review.md |

## Source Review

| Source | Useful Content | Issues / Gaps |
|---|---|---|
| Supplied SQL definition | Canonical output fields, join logic, derivations, adjustment logic, and likely source systems | No explicit business-facing supplier-invoice naming, evidence location, or target freshness query |
| contracts/workday_supplier_invoice/contract.yaml | Named owners, target entity, source refresh detail, support channels, SLA values, and operational diagnostics | Some evidence items remain `TBC` and placeholder fields remain unresolved |
| docs/entity-engine/client-engine/InvoiceHeader10.md | Invoice header terminology and related invoice context | Describes client-invoice entities, not the supplier-invoice contract directly |
| docs/entity-engine/client-engine/InvoiceLines10.md | DisbursementType and invoice line context used by the SQL | Describes client-invoice entities, not the supplier-invoice contract directly |
| docs/runbooks/entity-engine/client-invoice-missing.md | Existing client-invoice operational alert context, issue severity precedent, and support routing cues | Client-invoice specific and should not be treated as the supplier-invoice runbook |
| docs/runbooks/entity-engine/client-invoice-mismatches.md | Existing client-invoice reconciliation and mismatch monitoring patterns | Client-invoice specific and should not be treated as the supplier-invoice runbook |
| content/data-contracts/drafts/client-invoice-readiness.md | Prior invoice readiness draft that clearly belongs to client-invoice processing | Useful precedent only; not the supplier-invoice contract itself |

## Contract Gap Analysis

| Section | Status | Gap | Required Action |
|---|---|---|---|
| Identity | Strong | Product identity is now defined in the contract | Keep draft status until formal approval |
| Description | Strong | Purpose, problem, usage, and scope are now documented | Business Owner approval is still pending |
| Ownership | Strong | Named accountable roles are now present | Keep approval pending until formal review |
| Approval | Partial | Approvers are listed but approval history and decision records are empty | Populate during review and sign-off |
| Sources | Strong | Source systems, owners, refresh patterns, and access notes are documented | Confirm any remaining access-pattern wording with SME if needed |
| Targets | Strong | Target entity and consumer are now defined | Confirm workspace value when available |
| Lineage | Strong | Upstream and downstream lineage are documented | None beyond normal approval |
| Processing | Strong | Trigger, schedule, dependencies, and transformation flow are documented | None beyond normal review |
| Schema | Strong | Field definitions and owners are documented | Confirm treatment of placeholder null fields |
| Critical Data Elements | Strong | CDEs are explicitly flagged in the schema | Data Owner approval is still pending |
| Quality Rules | Partial | Operational rules are defined with severity and ownership | Confirm evidence location and whether warning rules should be stricter |
| SLA Properties | Strong | Refresh, latency, retention, and support responses are now defined | Formal approval is still required before activation |
| Monitoring | Partial | Supplier-invoice signals are now named consistently | Add dashboard and evidence source |
| Support Model | Strong | Support owner, email channel, and Teams channel are defined | Confirm whether out-of-hours support should be formalised |
| Runbook Diagnostics | Partial | Supplier-invoice diagnostics are documented | Confirm target freshness query |
| Change Management | Strong | Default process and change types are documented | Add review cadence if required by governance |
| References | Partial | Client-invoice precedent and supplier-invoice runbooks are linked | Add dashboard and evidence references when known |
| Glossary | Strong | Core operational terms are defined | None beyond normal review |

## Findings

### Medium - Placeholder fields remain in the published supplier-invoice schema

`VatAmount`, `CurrencyCode`, and `ChangeDate` remain contractual fields, but each is currently projected as null in the SQL logic.

Impact:
- Consumers may assume these attributes are available for operational or reporting use.
- Field-level completeness rules cannot yet be finalised.

Recommendation:
Confirm whether these fields are placeholders for planned enhancement or should be removed from the contract until populated.

### Low - Monitoring evidence and target freshness query are still incomplete

The contract still carries `TBC` values for `monitoring.dashboard`, `monitoring.evidenceLocation`, and the target freshness SQL diagnostic.

Impact:
- Operational evidence cannot yet be reviewed from a single authoritative source.
- Freshness incidents cannot be triaged using a contract-defined query.

Recommendation:
Add the evidence store, dashboard reference, and target freshness query once they are known.

## Required Human Confirmation

| Role | Confirmation Required |
|---|---|
| Data Owner | Placeholder field treatment, warning-rule tolerance, and final CDE approval |
| Business Owner | Formal approval of purpose, consumer scope, and SLA impact |
| Data Architect | Workspace value, dashboard, and evidence source |
| SME | EngSeqNum parsing assumptions and adjustment interpretation |
| Support Owner | Out-of-hours support expectation and freshness evidence source |

## Assumptions Used For Drafting

| Assumption | Basis |
|---|---|
| The entity is a curated Workday supplier invoice dataset rather than a raw staging table | Derived output aliases and multiple lookup enrichments in the supplied SQL |
| Existing generic invoice artefacts in the repo actually describe client-invoice behaviour | The artefacts point to ClientEngine entities and client-invoice operational flows |
| Separate client-invoice and supplier-invoice runbooks reduce ambiguity for support teams | The contract and older artefacts refer to different invoice domains |
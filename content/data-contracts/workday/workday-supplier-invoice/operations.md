# Workday Supplier Invoice

| Field | Value |
|---|---|
| Domain | Finance |
| Data Product | Workday Supplier Invoice |
| Contract Version | 0.1.0 |
| Status | Draft |
| Owner | Max Everest |
| Last Updated | 2026-05-15 |

## Operational Model

This operations view is aligned to the current draft contract for `FinancialEngine.out.Invoice11`. It uses the named Data Engineering support model in the YAML and separates supplier-invoice support from the older client-invoice runbooks.

## Support Channels

| Channel | Tool | Address | Scope |
|---|---|---|---|
| Data Engineering email | Email | `dlitfdst@rsmuk.com` | Initial triage and incident coordination |
| Data Engineering team | Teams | Data Engineering Team channel | Incident coordination and engineering collaboration |

## Triage Scenarios

| Issue | Symptom | Action |
|---|---|---|
| Missing supplier invoice records | Rows appear in `EEHub.dbo.WorkdaySupplierInvoiceMissing` | Confirm invoice age, scope, and downstream impact |
| Supplier invoice mismatch | Rows appear in `dbo.EntityEngineSupplierInvoiceMismatch` | Reconcile invoice totals to available source detail |
| Freshness breach | `FinancialEngine.out.Invoice11` is older than the agreed SLA | Check upstream readiness, pipeline status, and publish step |
| Data quality rule failure | Contract rule fails in notebook or pipeline validation | Determine whether the issue is a data defect, lookup defect, or platform failure |

## Diagnostics

| Diagnostic | How | Expected Result |
|---|---|---|
| Check missing supplier invoice monitor | `SELECT TOP 100 * FROM [EEHub].[dbo].[WorkdaySupplierInvoiceMissing] ORDER BY [invoiceDate] DESC` | No unresolved records outside the agreed SLA |
| Check supplier invoice mismatch monitor | `SELECT TOP 100 * FROM [dbo].[EntityEngineSupplierInvoiceMismatch] ORDER BY [PostedDate] DESC` | No unresolved mismatch records in scope |
| Validate source supplier invoice data | Query the Workday staging header and line tables by `OurRef` and `LineID` | Source data exists and matches expected invoice state |
| Validate target freshness | Query latest successful refresh for `FinancialEngine.out.Invoice11` | Latest publish is within approved SLA |
| Check failure audit | Review `Analytics.aud.Error` for related failures | Relevant failure entries are understood and linked to the incident |

## Escalation

| Scenario | Escalate To | Criteria |
|---|---|---|
| Widespread service failure | Technical Owner, Data Owner, Business Owner | Immediate for P1 or widespread impact |
| Multiple missing or mismatched supplier invoices | Data Owner and Business Owner | Within 3 hours when the issue meets P2 conditions |
| Single unresolved supplier invoice issue | Data Owner | Within 1 business day when unresolved |

## Operating Ownership

| Role | Name |
|---|---|
| Technical Owner | Data Engineering team |
| Support Owner | Data Engineering team |
| Data Owner | Max Everest |
| Business Owner | Brett Healey |
| Data Architect | Phil Howard |
| Source SME | Kelly Oliver |

## Related Runbooks

| Runbook | Use |
|---|---|
| [supplier-invoice-missing.md](../../../runbooks/entity-engine/supplier-invoice-missing.md) | Missing supplier-invoice scenarios and downstream integration impact |
| [supplier-invoice-mismatches.md](../../../runbooks/entity-engine/supplier-invoice-mismatches.md) | Supplier-invoice mismatch investigation |
| [client-invoice-missing.md](../../../runbooks/entity-engine/client-invoice-missing.md) | Existing client-invoice precedent only |
| [client-invoice-mismatches.md](../../../runbooks/entity-engine/client-invoice-mismatches.md) | Existing client-invoice precedent only |

## Confirmation Required

| Role | Required Decision |
|---|---|
| Support Owner | Confirm whether an out-of-hours or on-call support path should be added to the formal support section |
| Data Architect | Confirm the target freshness query and monitoring evidence source |
| SME | Confirm the supplier-invoice monitoring table names and alert semantics |

## Known Gaps

| Gap | Impact | Required Action | Owner |
|---|---|---|---|
| Target refresh diagnostic is unknown | Freshness incidents cannot be triaged consistently | Confirm target table and refresh evidence query | Data Architect |
| Dashboard and evidence location are still `TBC` | Monitoring evidence cannot yet be reviewed from a single authoritative source | Confirm dashboard and evidence store | Support Owner / Data Architect |
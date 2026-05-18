# Runbook: Supplier Invoice Mismatches

## Overview

| Runbook: | Supplier Invoice Mismatches |
| --- | --- |
| Data Contract: | workday_supplier_invoice |
| Related documentation: | [Workday Supplier Invoice](../../data-contracts/workday/workday-supplier-invoice/index.md) |
| Purpose: | Triage and resolution for alerts raised by the supplier-invoice mismatch monitoring pipeline. An alert indicates one or more supplier invoices where expected totals or adjustment state do not align to source detail and the discrepancy is older than 90 minutes. |
| Context: | This runbook is used when the monitoring workflow detects supplier-invoice mismatches and raises a P3 (or higher) alert. The monitoring workflow queries `[dbo].[EntityEngineSupplierInvoiceMismatch]` and notifies the Data Engineering team and stakeholders when records are found. |
| Systems: | Workday -> Data Engine -> FinancialEngine (`Invoice11`) -> EEAPI -> `Invoice11_PASO` |
| When to use: | Use this runbook when the monitoring service reports one or more records in `[dbo].[EntityEngineSupplierInvoiceMismatch]` or when related supplier-invoice jobs report processing failures. |

### Issue Severity

The importance of this process grows over the accounting period and when within 5 working days of the month end should be managed to the SLA one level above.

| Level | Description | SLA |
| --- | ---- | --- |
| P1 Critical | Failure of whole service | 1 hr SLA |
| P2 Urgent | Failures of multiple records | 3 hr SLA |
| P3 High | Single error record | 1 day SLA |
| P4 Medium | Data Quality issues | 3 day SLA |
| P5 Low | Service is impacted but working | 1 week SLA |

### Ownership

| Role | Who |
|---|---|
| Data Architect: | Phil Howard |
| Data Owner: | Max Everest |
| Business Owner: | Brett Healey |
| Technical Team: | Data Engineering |

--------------------------------------------------

## Quick Triage

| Issue | Expectation | Symptom | Action |
|-----|-----|-----|-----|
| Monitoring alert (one or more records) | P3/P2/P1 depending on volume and context | One or more rows in `[dbo].[EntityEngineSupplierInvoiceMismatch]` | Run diagnostics below; determine scope. |
| Multiple error records or large volume | P2 / P1 | Many rows returned; business processes impacted | Escalate to Data Owner and Business Owner; follow escalation steps. |
| No records but downstream reports show supplier-invoice issues | Investigate processing | No match in monitoring table, but consumers report incorrect supplier-invoice data | Check supplier-invoice processing and ingestion logs. |

--------------------------------------------------

## Diagnostics

| Issue Type | Diagnostic | How |
|-----|-----|-----|
| Monitoring workflow | Verify workflow run history | Check Power Automate run history for the supplier-invoice mismatch monitor and inspect relevant inputs and outputs. |
| Validate error records | Query mismatch table | `SELECT TOP 100 * FROM [dbo].[EntityEngineSupplierInvoiceMismatch] ORDER BY [PostedDate] DESC` |
| Reconcile supplier invoice source vs target | Inspect source and target tables | Query source staging and `FinancialEngine.out.Invoice11` for the offending invoice reference and validate totals or adjustment state. |
| Failure audit | Check analytics audit table | Review `[Analytics].[aud].[Error]` for entries created by the failure path. |

--------------------------------------------------

## Escalation

| Scenario | Escalate To | Criteria |
|-----|-----|-----|
| Service failure / data unavailable | Technical Team (Data Engineering), Data Owner, Business Owner | Immediate - P1 or widespread impact |
| Multiple error records affecting many supplier invoices | Data Owner, Business Owner | P2 - escalate within 3 hours |
| Single error record | Data Engineering -> Data Owner | P3 - escalate within 1 day if not resolved |
| Data quality issues | Data Owner | P4 - escalate within 3 days |

--------------------------------------------------

## Communication

| Audience | Phase | Message | Channel |
|-----|-----|-----|-----|
| Team | Investigation | The supplier-invoice monitoring service indicated an error at <time>. I am currently investigating and will raise a bug. | MS Teams |
| Business Owner & Data Owner | Investigation (P1) | The supplier-invoice service is failing as of <time>. We are currently investigating and will update you at <time>. | Email |
| Business Owner & Data Owner | Resolution (P1) | The supplier-invoice service has been restored. Any relevant outcomes from our debrief will be shared. | Email |
| Data Owner | Investigation (P2/P3/P4/P5) | The supplier-invoice service indicated errors at <time>. We are investigating and will update you at <time>. | Email |

--------------------------------------------------

## References & Commands

- Monitoring table: `[dbo].[EntityEngineSupplierInvoiceMismatch]`
- Target table: `FinancialEngine.out.Invoice11`
- Audit table: `Analytics.dbo.[aud].[Error]`

## Related Documentation

- [Workday Supplier Invoice Data Contract](../../data-contracts/workday/workday-supplier-invoice/index.md)
- [Contract Controls](../../data-contracts/workday/workday-supplier-invoice/controls.md)

## File

Path: content/runbooks/entity-engine/supplier-invoice-mismatches.md
# Runbook: EntityEngine Invoice Mismatches

## Overview

| Runbook: | EntityEngine Invoice Mismatches |
| --- | --- |
| Data Contract: | |
| Purpose: | Triage and resolution for alerts raised by the Entity Engine invoice mismatch monitoring pipeline. An alert indicates one or more invoices where the invoice header total does not equal the sum of its invoice lines and the discrepancy is older than 90 minutes since posting. | 
| Context: | This runbook is used when the monitoring workflow detects invoice header/line mismatches and raises a P3 (or higher) alert. The monitoring workflow queries `[dbo].[EntityEngineInvoiceMismatch]` and will notify the Data Engineering team and stakeholders when records are found. | 
| Systems: | PASO → Data Engine → ClientEngine (`InvoiceHeader10`, `InvoiceLines10`) → EEAPI → Workday integration database → Workday |
| When to use: | Use this runbook when the monitoring service reports one or more records in `[dbo].[EntityEngineInvoiceMismatch]` or when related Entity Engine jobs report invoice processing failures. | 

### Issue Severity

The importance of this process grows over the accounting period and when within 5 working days of the month end should be managed to the SLA one level above.

| Level | Description | SLA |
| --- | ---- | --- |
| P1 Critical |  Failure of whole service| 1 hr SLA  |
| P2 Urgent | Failures of multiple records | 3 hr SLA  |
| P3 High | Single error record | 1 day SLA  |
| P4 Medium | Data Quality issues | 3 day SLA  |
| P5 Low | Service is impacted but working | 1 week SLA | 

### Owernship
| Role | Who |
|---|---|
| Data Architect: | P H |
| Data Owner: | M E |
| Business Owner: | B H |
| Technical Team: | Data Engineering |

--------------------------------------------------


## Quick Triage

| Issue | Expectation | Symptom | Action |
|-----|-----|-----|-----|
| Monitoring alert (one or more records) | P3/P2/P1 depending on volume & context | One or more rows in `[dbo].[EntityEngineInvoiceMismatch]` | Run diagnostics below; determine scope. |
| Multiple error records or large volume | P2 / P1 | Many rows returned; business processes impacted | Escalate to Data Owner and Business Owner; follow escalation steps. |
| No records but downstream reports show missing invoices | Investigate processing | No match in monitoring table, but consumers report incorrect data | Check Entity Engine processing and ingestion logs; follow standard Entity Engine runbook. |


--------------------------------------------------


## Diagnostics

| Issue Type | Diagnostic | How |
|-----|-----|-----|
| Monitoring workflow | Verify workflow run history | Check Power Automate run history for `Dev - Data Engineering Monitor-EntityEngineInvoiceMismatch` and inspect inputs/outputs for `EntityEngine_Invoice_Mismatch_Test`. |
| Validate error records | Query mismatch table | `SELECT TOP 100 * FROM [dbo].[EntityEngineInvoiceMismatch] ORDER BY [PostedDate] DESC` — review keys (PasoTaxInvoiceKey) and timestamps. |
| Reconcile header vs lines | Inspect source tables | Query `ClientEngine.dbo.InvoiceHeader10` and `ClientEngine.dbo.InvoiceLines10` for the offending `PasoTaxInvoiceKey` and validate sums. |
| Entity Engine processing | Check Entity Engine logs and capture views | Inspect capture/audit views and recent job logs for failures or delays. |
| Failure audit | Check analytics audit table | If workflow failed, review `[Analytics].[aud].[Error]` for entries created by the failure path. |

**Use the Entity Engine runbook to assist in issue triage and reconciliation.**

--------------------------------------------------



## Escalation

| Scenario | Escalate To | Criteria |
|-----|-----|-----|
| Service failure / data unavailable | Technical Team (Data Engineering), Data Owner, Business Owner | Immediate — P1 or widespread impact |
| Multiple error records affecting many invoices | Data Owner, Business Owner | P2 — escalate within 3 hours |
| Single error record | Data Engineering -> Data Owner | P3 — escalate within 1 day if not resolved |
| Data quality issues | Data Owner | P4 — escalate within 3 days |
| Out of hours | On-call team (Data Engineering) | Team handles initial triage; business stakeholders are notified during business hours (08:30–17:30 UK) unless P1 or month-end impact. |

Special rule: If errors occur in the last week of the reporting month, escalate the issue to at least P3 and treat with elevated priority.

--------------------------------------------------


## Communication

Clear communication is critical. Use the templates below and update stakeholders at the agreed cadence.

| Audience | Phase | Message | Channel |
|-----|-----|-----|-----|
| Team | Investigation | The Entity Engine invoice monitoring service indicated an error at < time >. I am currently investigating and will raise a bug. | MS Teams |
| Business Owner & Data Owner | Investigation (P1) | The Invoice syncing service is failing as of < time >. We are currently investigating and will update you at < time >. | Email |
| Business Owner & Data Owner | Identification (P1) | The reason for the Invoice syncing failure has been identified and is being resolved. I will update you on progress at < time >. | Email |
| Business Owner & Data Owner | Resolution (P1) | The Invoice syncing service has been restored. Any relevant outcomes from our debrief will be shared. | Email |
| Data Owner | Investigation (P2/P3/P4/P5) | The Invoice syncing service indicated errors at < time >. We are investigating and will update you at < time >. | Email |
| Data Owner | Identification (P2/P3/P4/P5) | The reason for the Invoice syncing errors has been identified and is being resolved. I will update you on progress at < time >. | Email |
| Data Owner | Resolution (P2/P3/P4/P5) | The Invoice syncing service has been restored. Any relevant outcomes from our debrief will be shared. | Email |

Note: If an alert is received outside UK business hours (08:30–17:30), delay communication to business stakeholders until business hours unless the incident is P1 or impacts month-end reporting.

--------------------------------------------------


## References & Commands

- Monitoring workflow: `Dev-DataEngineeringMonitor-EntityEngineInvoiceMismatch` (Power Automate).  
- Mismatch table: `[dbo].[EntityEngineInvoiceMismatch]`  
- Source tables: `ClientEngine.dbo.InvoiceHeader10`, `ClientEngine.dbo.InvoiceLines10`  
- Audit table: `Analytics.dbo.[aud].[Error]`  
- Follow the standard Entity Engine runbook for reprocessing instructions.


## File

Path: content/runbooks/entity-engine/invoice-mismatches.md

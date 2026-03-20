# Runbook: Workday Missing Invoices

## Overview

| Runbook: | Workday Missing Invoices |
| --- | --- |
| Data Contract: | |
| Purpose: | Triage and resolution for alerts where invoices raised at least 24 hours ago are missing from the integration layer and are therefore not available for downstream Workday processing. |
| Context: | This runbook is used when monitoring detects missing invoices in the integration layer and raises a P3 (or higher) alert. The monitoring workflow queries `EEHub.dbo.WorkdayInvoiceMissing` and notifies the Data Engineering inbox when records are found. |
| Systems: | PASO -> Data Engine -> ClientEngine (`InvoiceHeader10`) -> EEAPI -> Integration layer -> Workday integration database -> Workday |
| When to use: | Use this runbook when the monitoring service reports one or more records in `EEHub.dbo.WorkdayInvoiceMissing` or when users report invoices older than 24 hours missing from integration outputs. |

### Issue Severity

The importance of this process grows over the accounting period and when within 5 working days of the month end should be managed to the SLA one level above.

| Level | Description | SLA |
| --- | ---- | --- |
| P1 Critical | Failure of whole service | 1 hr SLA |
| P2 Urgent | Failures of multiple records | 3 hr SLA |
| P3 High | Single error record | 1 day SLA |
| P4 Medium | Data Quality issues | 3 day SLA |
| P5 Low | Service is impacted but working | 1 week SLA |

### Owernship
| Role | Who |
|---|---|
| Data Architect: | P H |
| Data Owner: | M E |
| Business Owner: | B H |
| Technical Team: | Data Engineering Team |

--------------------------------------------------

## Quick Triage

| Issue | Expectation | Symptom | Action |
|-----|-----|-----|-----|
| Monitoring alert (one or more records) | P3/P2/P1 depending on volume and context | One or more rows in `EEHub.dbo.WorkdayInvoiceMissing` where invoice age >= 24 hours | Run diagnostics below and determine scope. |
| Multiple missing invoices or large volume | P2 / P1 | Large number of invoices missing from integration outputs | Escalate to Data Owner and Business Owner; follow escalation steps. |
| Single missing invoice >= 24 hours | P3 | Isolated missing invoice in monitoring output | Validate source and pipeline processing; track to resolution. |
| No records in monitoring table but business reports missing invoices | Investigate processing | Monitoring table clear, but consumers cannot find invoices | Check Entity Engine processing and ingestion logs; follow standard Entity Engine runbook. |
| Month-end proximity with unresolved missing invoices | Elevate priority by one SLA level | Missing invoices near reporting cut-off | Treat as elevated severity and escalate early. |

--------------------------------------------------

## Diagnostics

| Issue Type | Diagnostic | How |
|-----|-----|-----|
| Monitoring workflow | Verify workflow run history | Check Power Automate run history for the missing-invoice monitor and inspect inputs/outputs for the table query step. |
| Validate missing invoices | Query missing-invoice table | `SELECT TOP 100 * FROM [EEHub].[dbo].[WorkdayInvoiceMissing] ORDER BY [invoiceDate] DESC` and confirm invoices are >= 24 hours old. |
| Source validation | Confirm invoice exists in source | Query source invoice tables for the missing invoice keys and validate posted/raised state. |
| Integration validation | Confirm invoice absent in integration layer | Query integration-layer invoice tables/views to confirm invoice has not landed. |
| Entity Engine processing | Check Entity Engine logs and capture views | Inspect capture/audit views and recent job logs for failures or delays affecting invoice flow. |
| Failure audit | Check analytics audit table | If workflow failed, review `Analytics.aud.Error` for entries created by the failure path. |

**Use the Entity Engine runbook to assist in issue triage and reconciliation.**

--------------------------------------------------

## Escalation

| Scenario | Escalate To | Criteria |
|-----|-----|-----|
| Service failure / data unavailable | Technical Team (Data Engineering), Data Owner, Business Owner | Immediate - P1 or widespread impact |
| Multiple missing invoices affecting many records | Data Owner, Business Owner | P2 - escalate within 3 hours |
| Single missing invoice | Data Engineering -> Data Owner | P3 - escalate within 1 day if not resolved |
| Data quality issues | Data Owner | P4 - escalate within 3 days |
| Out of hours | On-call team (Data Engineering) | Team handles initial triage; business stakeholders are notified during business hours (08:30-17:30 UK) unless P1 or month-end impact. |

Special rule: If errors occur in the last week of the reporting month, escalate the issue to at least P3 and treat with elevated priority.

--------------------------------------------------

## Communication

Clear communication is critical. Use the templates below and update stakeholders at the agreed cadence.

| Audience | Phase | Message | Channel |
|-----|-----|-----|-----|
| Team | Investigation | The invoice missing-integration monitoring service indicated an error at <time>. I am currently investigating and will raise a bug. | MS Teams |
| Business Owner & Data Owner | Investigation (P1) | The invoice integration service is failing as of <time>. We are currently investigating and will update you at <time>. | Email |
| Business Owner & Data Owner | Identification (P1) | The reason for the invoice integration failure has been identified and is being resolved. I will update you on progress at <time>. | Email |
| Business Owner & Data Owner | Resolution (P1) | The invoice integration service has been restored. Any relevant outcomes from our debrief will be shared. | Email |
| Data Owner | Investigation (P2/P3/P4/P5) | The invoice integration service indicated missing invoices at <time>. We are investigating and will update you at <time>. | Email |
| Data Owner | Identification (P2/P3/P4/P5) | The reason for the missing invoices has been identified and is being resolved. I will update you on progress at <time>. | Email |
| Data Owner | Resolution (P2/P3/P4/P5) | The invoice integration service has been restored and missing invoices have been revalidated. Any relevant outcomes from our debrief will be shared. | Email |

Note: If an alert is received outside UK business hours (08:30-17:30), delay communication to business stakeholders until business hours unless the incident is P1 or impacts month-end reporting.

--------------------------------------------------

## References & Commands

- Monitoring table: `EEHub.dbo.WorkdayInvoiceMissing`
- Source tables: `ClientEngine.dbo.InvoiceHeader10`
- Reference table: `DataEngine.dbo.WorkDayDataStaging_out_Billing`
- Audit table: `Analytics.dbo.aud.Error`
- Follow the standard Entity Engine runbook for reprocessing instructions.

## File

Path: content/runbooks/invoice-missing.md

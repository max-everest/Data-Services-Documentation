# Runbook: Example Process

## Overview

|Runbook: | Journals - Time |
| --- | --- |
|Data Contract: Data Analytics - Data Contracts
| Purpose: | Operational triage and resolution for the Journals Time pipeline. |
| Context: | Journals must be posted to Workday to maintain business accounts. The Journals Time report enables this process. Failures, quality issues, or user queries must be reviewed promptly. | 
| Systems: | PASO → Data Engine → Financial Engine → EEAPI | 
| When to use: | Use this runbook for incident investigation, performance review, or user queries relating to this pipeline. |

### Issue Severity
| Level | Description | SLA |
| --- | ---- | --- |
| P1 – Urgent | Failure of the entire service  | SLA: 1 hour | 
| P3 – High | Failure of key elements of the service | SLA: 1 day | 
| P5 – Low | Service degraded but operational | SLA: 1 week |

### Owernship
| Role | Who |
|---|---|
| Data Architect: | Adam Smith |  
| Data Owner: | Jane Bloggs |
| Business Owner: | Joe Bloggs |
| Technical Team: | Data Engineering |


--------------------------------------------------


## Quick Triage

| Issue | Expectation | Symptom | Action |
|-----|-----|-----|-----|
| Entity processed but user expectation incorrect | Data refreshed according to contract | Output differs from user expectation | Confirm behaviour matches contract |
| Entity not processed with error | Data refreshed according to schedule | Error appears in logs | Raise bug and follow communication plan |
| Entity not processed without error | Scheduled refresh expected | Data missing but no error | Investigate monitoring failure |
| Known Entity Engine issue | Platform operating normally | Entity Engine processing issue | Follow Entity Engine bug runbook |
| Known Data Engine issue | Platform operating normally | Data Engine processing issue | Follow Data Engine bug runbook |
| Entity values incorrect | Values reconcile with reports | Reconciliation report shows systemic failure | Raise P1 incident |
| Minor reconciliation variance | Values reconcile broadly | Small number of discrepancies | Raise P3 issue and investigate |


--------------------------------------------------


## Diagnostics

| Issue Type | Diagnostic | How |
|-----|-----|-----|
| Data Refresh | Check entity processing | Inspect schedule log |
| Data Refresh | Check Data Engine processing | Review capture views and audit logs |
| Data Refresh | Verify entity service | Confirm Entity Engine service running |
| Data Refresh | Check source system | Confirm PASO availability |
| Incorrect Values | Review entity business logic | Inspect production entity definition |
| Incorrect Values | Test entity logic | Export and execute locally |
| Incorrect Values | Validate data engine output | Compare source tables to processed tables |


--------------------------------------------------



## Escalation

| Scenario | Escalate To | Criteria |
|-----|-----|-----|
| Entity Engine error | Technical team | Immediate |
| Data Engine error | Technical team | Immediate |
| Data quality breach | Data Owner | Breach exceeds tolerance |
| SLA risk | Product Owner | After 07:00 |
| Business change request | Data Architect | Change request required |


--------------------------------------------------


## Communication

Clear communication is critical to managing business impact during incidents.

Use structured updates and maintain an appropriate update cadence.

Typical update frequency: 60–90 minutes.

| Audience | Phase | Message | Channel |
|-----|-----|-----|-----|
| Team | Investigation | The feed has failed at <time>. Investigation underway. | Teams |
| Business Owner | Investigation | The feed has failed at <time>. Investigation in progress. | Email |
| Business Owner + Data Owner | Identification | Root cause identified. Resolution underway. | Email |
| Business Owner + Data Owner | Resolution | Service restored and processing resumed. | Email |
| Team | Data quality investigation | Data query raised and being investigated. | Teams |

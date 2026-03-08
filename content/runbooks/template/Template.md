# Template

## Overview

| Runbook: | Journals - Time |
| --- | --- |
| Data Contract: | Data Analytics - Data Contracts |
| Purpose: | Operational triage and resolution for Journals Time pipeline |
| Context: | Journals need to be posted to Workday to maintain business accounts. The Journals Time report enables this and while the business doesn not currently complete journalling till the end of the month; failures, quality issues, or questions need prompt review |
| Systems: | PASO -> Data Engine -> Financial Engine -> EEAPI |
| When to use: | Initial investigation and triage of an incident, performance reivew, user queries. |

### Issue severity: 
| Level | Description | SLA |
| --- | ---- | --- |
| P1 Urgent | Failure of whole service | 1 hr SLA |
| P3 High | Failures of elements of service | 1 day SLA |
| P5 Low | Service is impacted but working | 1 week SLA |


### Owernship
| Role | Who |
|---|---|
|Data architect | xxx |
|Data owner | xxx |
|Business owner| xxx |
|Technical team | xxx |

## Diagnostics

What can be done to triage and understand the potential issue.

| Issue Type | Diagnostic | How |
| --- | --- | --- |
| Data Refresh | Check the entity processing | Check the schedule log for errors or gaps of processing |
|  | Check the data engine processing | Check the Captured view for last process and the audit log for detailed information |
|  | Check the entity service | Make sure the Entity Engine Service is working |
|  | Check the source application is running | Speak to PASO team  |
| Incorrect Values | Check the entity business logic | Open the production entity defintiion and confirm logic and rules |
|  | Test the entity logic | Export the production entity and run locally |
|  | Check the data engine processing | Check the Captured view for last process and the audit log for detailed information |
|  | Check the data engine data | If processing compare Data Engine table to source table |
| Incorrect Details | Check the related entities | Open the production entity defintiion and confirm logic and rules |
|  | Test the entity logic | Export the production entity and run locally |
|  | Check the entity engine processing | Check the schedule log for errors or gaps of processing |
|  | Check the data engine processing | Check the Captured view for last process and the audit log for detailed information |

## Escalation

Who should be notified when 

| Scenario | Escalate To | Criteria |
| --- | --- | --- |
| Entity Engine error | Technical team | Immediate |
| Data Engine error | Technical team | Immediate |
| DQ breach | Data Owner | > tolerance |
| SLA risk | Product Owner | If after 07:00 |
| Business change | Data architect | Change request |

## Communication

### Communication approach 

Clear communication is the key to managine the impact to business from issues and to allow focus to investigate and resovle. The following templates should be used and expanded on where appropriate to maintain clear communication. When setting update cadence, chosed a frequency that reflects the servity of the isssue but should capture progres, 60-90mins is often best. 


| Audience | Phase | Message | Forum |
| --- | --- | --- | --- |
| Team | Investigation | The XXX feed has failed at <time>. I am currently investigating and will raise a bug. | MS Teams |
| Business Owner | Investigation | The XXX feed has failed at <time>. We are currently investigating and will updated you at <time>. | Email |
| Business Owner & Data Owner | Identification  | The reason for the XXX failure has been identfied and is being resolved. I will updated you on progress at <time>. | Email |
| Business Owner & Data Owner | Resolution | The XXX issue has been resolved and service restored. Any relevant outcomes from our debrief will be shared. | Email |
| Team | Data quality - Investigation | An query has been raised with the XXX feed. This is currently being investigated an bug raised if needed. | MS Teams |
| Business Owner & Data Owner | Data quality - Issue confirmed | An issue has been identified with the XXX feed. This is currently being investigated and an update will be provided at <time>. | Email |
| Business Owner & Data Owner | Data quality - Change request | After investigation a change request has been identified for the XXX feed. The request has been raised for reivew. | Email |
| Business Owner & Data Owner | Data quality - Identification | The reason for the XXX failure has been identfied and is being resolved. I will updated you on progress at <time>. | Email |
| Business Owner & Data Owner | Data quality - Resolution | The XXXissue has been resolved and service restored. Any relevant outcomes from our debrief will be shared. | Email |

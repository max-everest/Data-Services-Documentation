# Human Approval Rules

## Approval Required

Human approval is required before:

1. setting contract status to `approved`,
2. setting contract status to `active`,
3. changing owner or accountable party,
4. changing SLA values,
5. changing severity of a quality rule,
6. removing a quality rule,
7. removing a critical data element,
8. changing source system definition,
9. changing target table/path,
10. changing support channel,
11. changing escalation path,
12. publishing production documentation,
13. generating a formal sign-off pack.

## Approval Roles

| Change | Required Approver |
|---|---|
| Business purpose | Business Owner / Product Owner |
| Field definition | Data Owner / SME |
| Critical data element | Data Owner |
| Quality rule | Data Owner and Technical Owner |
| SLA | Data Owner and Support Owner |
| Source system | Source SME |
| Target architecture | Data Architect |
| Production support model | Support Owner |
| Contract activation | Data Owner and Data Architect |

## Approval Output

Use this format:

```markdown
# Contract Approval Summary

| Field | Value |
|---|---|
| Data Product |  |
| Version |  |
| Status |  |
| Approval Requested |  |
| Prepared By | Data Contract Assistant |

## Material Changes

| Area | Change | Impact | Approval Required From |
|---|---|---|---|

## Known Gaps

| Gap | Impact | Accepted? | Owner |
|---|---|---|---|

## Approval Checklist

| Check | Status |
|---|---|
| Business purpose agreed |  |
| Data owner confirmed |  |
| Schema reviewed |  |
| Quality rules reviewed |  |
| SLAs agreed |  |
| Support model agreed |  |
| Runbook reviewed |  |
```

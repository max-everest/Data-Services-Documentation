# CaseLogLoad10

Summary: Case log and engagement metadata.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| OpportunityDynamicsKey | Edm.Guid | false |
| Project_Name | Edm.String | true |
| Closed | Edm.DateTimeOffset | true |
| PasoKey | Edm.Int32 | true |
| EngagementDate | Edm.DateTimeOffset | true |
| EngagementConcluded | Edm.Int32 | false |
| DateEngagementConcluded | Edm.DateTimeOffset | true |
| Confidential | Edm.Int32 | false |
| Subject_Entity | Edm.String | true |
| Sector | Edm.String | true |
| SubSector | Edm.String | true |
| CaseType | Edm.Int32 | false |
| Engaging_Client | Edm.String | true |
| LeadSource | Edm.String | true |
| Refinance_Opportunity | Edm.Int32 | false |
| Lead_Partner_Username | Edm.String | true |
| Lead_Partner_ID | Edm.Int32 | true |
| RecurringFee | Edm.Decimal | true |
| NonRecurringFee | Edm.Decimal | true |
| ContingentFee | Edm.Decimal | true |
| TotalFees | Edm.Int32 | true |
| Turnover | Edm.Int64 | true |
| Debt | Edm.Int64 | true |
| OpportunityLine | Edm.String | true |

## API Usage


### Filter example
`GET /api/clientengine/CaseLogLoad10?$filter=Lead_Partner_ID eq 42`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — 201/204/500 and similar non-200 responses.

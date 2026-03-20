# Relationship10

Summary: Relationship records linking people and clients with roles and dates.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ClientKey | Edm.Int32 | false |
| EmploymentKey | Edm.Int32 | true |
| EndDate | Edm.DateTimeOffset | true |
| IsActive | Edm.Boolean | true |
| IsRelationshipActive | Edm.Int32 | false |
| Name | Edm.String | true |
| Office | Edm.String | true |
| Rank | Edm.Int64 | true |
| Region | Edm.String | true |
| RelationshipPasoKey | Edm.Int32 | true |
| RelationshipPayrollKey | Edm.String | true |
| RelationshipType | Edm.String | true |
| RelationshipTypeKey | Edm.Int32 | true |
| StartDate | Edm.DateTimeOffset | true |
| UserName | Edm.String | true |

## API Usage

- GET /api/clientengine/Relationship10

### Filter example
`GET /api/clientengine/Relationship10?$filter=ClientKey eq 123 and IsActive eq true`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [docs/entity-engine/api.md](docs/entity-engine/api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201/204/500 and similar non-200 responses.

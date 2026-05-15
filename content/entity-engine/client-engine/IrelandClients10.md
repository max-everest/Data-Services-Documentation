# IrelandClients10

Summary: Client subset for Ireland with CSE details and active flags.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ClientKey | Edm.Int32 | false |
| ClientCode | Edm.String | true |
| ClientName | Edm.String | true |
| ClientStatus | Edm.String | true |
| CSEIrelandKey | Edm.Int32 | true |
| CSEEmploymentKey | Edm.Int32 | true |
| CSEName | Edm.String | true |
| CSEPayrollKey | Edm.String | true |
| CSEOffice | Edm.String | true |
| IsCSEActive | Edm.Int32 | false |
| IsActive | Edm.Int32 | true |
| IsDeleted | Edm.Int32 | true |
| StartDate | Edm.DateTimeOffset | true |
| EndDate | Edm.DateTimeOffset | false |
| ChangeDate | Edm.DateTimeOffset | true |

## API Usage

- GET /api/clientengine/IrelandClients10

### Filter example
`GET /api/clientengine/IrelandClients10?$filter=IsActive eq 1`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — 201/204/500 and similar non-200 responses.

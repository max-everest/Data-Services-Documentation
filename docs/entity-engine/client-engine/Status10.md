# Status10

Summary: Client status flags and indicators.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ClientKey | Edm.Int32 | false |
| ClientStatus | Edm.String | true |
| ClientType | Edm.String | true |
| IsInternational | Edm.Int32 | true |
| IsOrganisation | Edm.Int32 | false |
| IsActive | Edm.Int32 | false |
| HasOpenEngagement | Edm.Boolean | true |
| EngagementActionActive | Edm.Int32 | false |

## API Usage

- GET /api/clientengine/Status10

### Filter example
`GET /api/clientengine/Status10?$filter=IsActive eq 1`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [docs/entity-engine/api.md](docs/entity-engine/api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — 201/204/500 and similar non-200 responses.

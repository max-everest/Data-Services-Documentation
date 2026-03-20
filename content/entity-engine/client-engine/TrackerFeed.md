# TrackerFeed

Summary: Feed for tracker records with high-level company identifiers and flags.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| Name | Edm.String | true |
| HomeOfficeName | Edm.String | true |
| SectorText | Edm.String | true |
| SubSectorName | Edm.String | true |
| PasoClientId | Edm.String | true |
| CompanyNumber | Edm.String | true |
| Id | Edm.Guid | false |
| Client | Edm.Boolean | true |
| ExClient | Edm.Boolean | true |
| Target | Edm.Boolean | true |
| Intermediary | Edm.Boolean | true |
| TargetType | Edm.String | true |
| Supplier | Edm.Boolean | true |
| Competitor | Edm.Boolean | true |
| CSEKey | Edm.String | true |
| CSE | Edm.String | true |
| OwnerKey | Edm.String | true |
| Owner | Edm.String | true |
| LinkToAccountWithinDynamics | Edm.String | true |
| IsPASORecord | Edm.Boolean | true |
| Paso_CSEOffice | Edm.String | true |
| Paso_CSEKey | Edm.Int32 | true |
| Paso_CSE | Edm.String | true |
| Paso_IsActive | Edm.Int32 | true |

## API Usage

- GET /api/clientengine/TrackerFeed

### Filter example
`GET /api/clientengine/TrackerFeed?$filter=Client eq true and SectorText eq 'Technology'`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [docs/entity-engine/api.md](docs/entity-engine/api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201/204/500 and similar non-200 responses.

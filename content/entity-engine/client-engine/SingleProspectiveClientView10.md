# SingleProspectiveClientView10

Summary: View for prospective clients with contact and address info.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| BDStatus | Edm.String | true |
| ChangeDate | Edm.DateTimeOffset | true |
| City | Edm.String | true |
| ClientKey | Edm.Int32 | false |
| ClientName | Edm.String | true |
| CompanyHouseKey | Edm.String | true |
| Country | Edm.String | true |
| County | Edm.String | true |
| CreatedOn | Edm.DateTimeOffset | true |
| CSEEmploymentKey | Edm.Int32 | true |
| DynamicsKey | Edm.String | true |
| FirstName | Edm.String | true |
| IsActive | Edm.Boolean | true |
| IsClient | Edm.Boolean | true |
| IsCompetitor | Edm.Boolean | true |
| IsExClient | Edm.Boolean | true |
| IsIntermediary | Edm.Boolean | true |
| IsInternational | Edm.Boolean | true |
| IsOrganisation | Edm.Boolean | true |
| IsSupplier | Edm.Boolean | true |
| IsTarget | Edm.Boolean | true |
| LastName | Edm.String | true |
| Line1 | Edm.String | true |
| Line2 | Edm.String | true |
| Line3 | Edm.String | true |
| NearestOffice | Edm.String | true |
| OrganisationType | Edm.String | true |
| OwnerEmploymentKey | Edm.Int32 | true |
| PostalCode | Edm.String | true |
| Prefix | Edm.String | true |
| PrimaryEmailAddress | Edm.String | true |
| PrimaryPhoneNumber | Edm.String | true |
| Sector | Edm.String | true |
| SubSector | Edm.String | true |
| TargetColour | Edm.String | true |
| TargetType | Edm.String | true |
| Type | Edm.String | true |

## API Usage

- GET /api/clientengine/SingleProspectiveClientView10

### Filter example
`GET /api/clientengine/SingleProspectiveClientView10?$filter=City eq 'London'`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201/204/500 and similar non-200 responses.

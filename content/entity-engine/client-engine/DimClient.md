# DimClient

Summary: Core client entity containing identifiers, names, contact and status flags.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ClientPasoKey | Edm.Int32 | false |
| CSEPasoKey | Edm.Int32 | true |
| ParentClientPasoKey | Edm.Int32 | true |
| FirmPasoKey | Edm.Int32 | false |
| ClientCode | Edm.String | true |
| ClientName | Edm.String | true |
| TypeCode | Edm.String | true |
| MailingName | Edm.String | true |
| Type | Edm.String | true |
| OrgTypeKey | Edm.Int32 | true |
| OrgTypeCode | Edm.String | true |
| OrgType | Edm.String | true |
| OrganisationKey | Edm.Int32 | false |
| Start | Edm.DateTimeOffset | true |
| IndustryFocusKey | Edm.Int32 | true |
| IndustryFocusCode | Edm.String | true |
| IndustryFocus | Edm.String | true |
| Email | Edm.String | true |
| MainPhone | Edm.String | true |
| Status | Edm.String | true |
| CreditTerms | Edm.String | true |
| CreditControlStatus | Edm.String | true |
| TaxSubType | Edm.String | true |
| Currency | Edm.String | true |
| IsActive | Edm.Int32 | true |
| TitledSalutation | Edm.String | true |
| FamilyName | Edm.String | true |
| FirstName | Edm.String | true |
| GivenNames | Edm.String | true |
| PreferredGivenName | Edm.String | true |
| Initials | Edm.String | true |
| TitleCode | Edm.String | true |
| Title | Edm.String | true |
| IsCreditControl | Edm.Int32 | true |
| IsDebtor | Edm.Byte | true |
| IsSupplier | Edm.Byte | true |
| IsEmployee | Edm.Int32 | false |
| IsInternal | Edm.Int32 | false |
| IsOrganisation | Edm.Int32 | false |
| IsFuture | Edm.Int32 | false |

## API Usage

- GET /api/clientengine/DimClient
- GET /api/clientengine/DimClient(C_EntityKey)

### Filtered query

Example: `GET /api/clientengine/DimClient?$filter=ClientKey eq 123&$select=ClientName,Email`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide for details: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201 Created, 204 No Content, 500 Server Error (and other non-200 responses).

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide for details: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — 201 Created, 204 No Content, 500 Server Error (and other non-200 responses).

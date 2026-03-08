# Entity Engine API - Developer How To Guide

Welcome to the Entity Engine API! This guide will help you get started with developing against and using the Entity Engine API.

---

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
- [Authentication](#authentication)
- [Available Endpoints](#available-endpoints)
- [Making API Requests](#making-api-requests)
- [Querying Data with OData](#querying-data-with-odata)
- [Understanding API Schema with $metadata](#understanding-api-schema-with-metadata)
- [Common Tasks](#common-tasks)
- [Error Handling](#error-handling)
- [Best Practices](#best-practices)
- [Resources](#resources)

---

## Overview

The Entity Engine API is a RESTful web service built on ASP.NET that provides access to Entity Engine data across multiple business domains. It supports:

- **Application Engine** - Application management data
- **Client Engine** - Client relationship data
- **Engagement Engine** - Engagement tracking data
- **Financial Engine** - Financial data and calculations
- **Standard Engine** - Standard reference data
- **Person Engine** - Person/individual data

The API uses:
- **Microsoft Restier** for OData query support
- **Entity Framework** for database access
- **OAuth 2.0** for authentication
- **OData v4** for advanced querying capabilities

---

## Getting Started

### Prerequisites

Before you can use the API, you need:

1. **Client Credentials** - Contact your administrator to obtain:
   - `client_id` - Your unique application identifier
   - `client_secret` - Your secure authentication token

2. **Network Access** - Your IP address must be whitelisted (unless IP check is disabled in configuration)

3. **Development Tools** - Any of the following:
   - Postman (recommended for testing)
   - cURL or similar command-line tools
   - Your programming language's HTTP client library

### Base URL

The API is accessible at:

```
http://<your-server>/api/
```

Each engine endpoint uses the format:

```
http://<your-server>/api/<EngineType>
```

**Example endpoints:**
- `http://your-server/api/Application`
- `http://your-server/api/Client`
- `http://your-server/api/Standard`

---

## Authentication

The Entity Engine API uses **OAuth 2.0** with bearer token authentication.

### Step 1: Request an Access Token

**Request:**

```
POST /token HTTP/1.1
Host: your-server
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials
&client_id=YOUR_CLIENT_ID
&client_secret=YOUR_CLIENT_SECRET
```

**Example using cURL:**

```bash
curl -X POST http://your-server/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=client_credentials&client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET"
```

**Example using Postman:**

1. Click **New** → **Request**
2. Select **POST** method
3. Enter URL: `http://your-server/token`
4. Go to **Body** tab → **x-www-form-urlencoded**
5. Add parameters:
   - Key: `grant_type` | Value: `client_credentials`
   - Key: `client_id` | Value: (your client ID)
   - Key: `client_secret` | Value: (your client secret)
6. Click **Send**

**Response:**

```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 300
}
```

**Important:** Access tokens expire after 5 minutes. You must request a new token when it expires.

### Step 2: Use the Token in API Requests

Include the token in the `Authorization` header of all API requests:

```
Authorization: Bearer <your_access_token>
```

**Example using cURL:**

```bash
curl -X GET http://your-server/api/Standard \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

**Example using Postman:**

1. Go to the **Headers** tab
2. Add a new header:
   - Key: `Authorization`
   - Value: `Bearer <your_access_token>`

---

## Available Endpoints

### Application

Access application management and tracking data.

**Base URL:** `/api/Application`

**Typical operations:** Create, read, update, retrieve applications and related data.

### Client

Access client and customer relationship data.

**Base URL:** `/api/Client`

**Typical operations:** Retrieve client information, client hierarchies, and relationships.

### Engagement

Access engagement and interaction tracking data.

**Base URL:** `/api/Engagement`

**Typical operations:** Retrieve engagement records, interaction history, activities.

### Financial

Access financial data and calculations.

**Base URL:** `/api/Financial`

**Typical operations:** Retrieve financial records, calculations, and reports.

### Person

Access person/individual data.

**Base URL:** `/api/Person`

**Typical operations:** Retrieve person records and attributes.

### Standard

Access standard reference and master data.

**Base URL:** `/api/Standard`

**Typical operations:** Retrieve reference tables, lookups, and standard data.

---

## Making API Requests

### Basic GET Request

Retrieve a list of resources:

```bash
GET /api/Standard HTTP/1.1
Host: your-server
Authorization: Bearer <your_access_token>
```

### Advanced GET with OData Query

Retrieve filtered data with specific columns:

```bash
GET /api/Standard/Endpoint?$filter=Status eq 'Active'&$select=Id,Name,Status HTTP/1.1
Host: your-server
Authorization: Bearer <your_access_token>
```

### Response Status Codes

| Status Code | Meaning |
|---|---|
| **200 OK** | Request succeeded, data returned |
| **201 Created** | Resource created successfully |
| **204 No Content** | Request succeeded, no content to return |
| **400 Bad Request** | Invalid request format or parameters |
| **401 Unauthorized** | Missing or invalid authentication token |
| **403 Forbidden** | Authenticated but not authorized for this resource |
| **404 Not Found** | Resource not found |
| **500 Server Error** | Internal server error |

---

## Querying Data with OData

The Entity Engine API supports **OData v4** query language, enabling powerful data filtering, sorting, and selection capabilities.

### Common OData Query Options

#### 1. Select Specific Columns

Return only the columns you need:

```
GET /api/Standard/Endpoint?$select=Id,Name,Description
```

**Result:** Only returns Id, Name, and Description fields.

#### 2. Filter Data

Filter results by conditions:

```
GET /api/Standard/Endpoint?$filter=Status eq 'Active'
```

**Common operators:**
- `eq` - Equals
- `ne` - Not equals
- `gt` - Greater than
- `ge` - Greater than or equal
- `lt` - Less than
- `le` - Less than or equal
- `and` - Logical AND
- `or` - Logical OR
- `not` - Logical NOT

**Examples:**

```
# Status equals Active
?$filter=Status eq 'Active'

# Name contains "Test"
?$filter=contains(Name, 'Test')

# CreatedDate greater than January 1, 2024
?$filter=CreatedDate gt 2024-01-01Z

# Multiple conditions
?$filter=Status eq 'Active' and Department eq 'Finance'
```

#### 3. Sort Results

Order results by one or more fields:

```
GET /api/Standard/Endpoint?$orderby=Name asc
GET /api/Standard/Endpoint?$orderby=CreatedDate desc, Name asc
```

**Options:**
- `asc` - Ascending order (default)
- `desc` - Descending order

#### 4. Paging Results

Retrieve data in pages to manage large result sets:

```
GET /api/Standard/Endpoint?$skip=0&$top=100
```

**Parameters:**
- `$skip` - Number of records to skip (for pagination)
- `$top` - Maximum number of records to return (default and max: 1,000,000)

**Example pagination:**

```
# First page (records 1-50)
?$skip=0&$top=50

# Second page (records 51-100)
?$skip=50&$top=50

# Third page (records 101-150)
?$skip=100&$top=50
```

#### 5. Combine Query Options

Create powerful queries by combining multiple options:

```
GET /api/Standard/Endpoint?$filter=Status eq 'Active' and CreatedDate gt 2024-01-01Z
&$select=Id,Name,Status,CreatedDate
&$orderby=CreatedDate desc
&$top=100
```

### OData Query Limits

The API enforces validation limits to ensure performance:

| Limit | Value |
|---|---|
| Max Node Count | 200 |
| Max Skip | 100,000,000 |
| Max Top | 1,000,000 |
| Max Expansion Depth | 2 |
| Max Order By Nodes | 2 |
| Max Any/All Expression Depth | 2 |

---

## Understanding API Schema with $metadata

The OData protocol provides a special `$metadata` endpoint that returns the complete schema description for an API, including all available entities, properties, data types, and constraints. This is invaluable when developing against the Entity Engine API.

### What is $metadata?

The `$metadata` endpoint returns an **XML Document** that describes:

- **Entity Types** - All available data models
- **Property Names** - Field names for each entity
- **Data Types** - The data type of each property (string, int, datetime, etc.)
- **Nullable Status** - Whether fields allow null/empty values
- **Key Properties** - Which fields uniquely identify records
- **Navigation Properties** - Relationships between entities

### Accessing Metadata

To retrieve metadata for any API endpoint, append `/$metadata` to the endpoint URL:

**Format:**

```
GET /api/<EngineType>/$metadata HTTP/1.1
Host: your-server
Authorization: Bearer <your_access_token>
```

**Examples:**

```
https://<your-server>/api/Standard/$metadata
https://<your-server>/api/Application/$metadata
https://<your-server>/api/Engagement/$metadata
https://<your-server>/api/Client/$metadata
https://<your-server>/api/Financial/$metadata
https://<your-server>/api/Person/$metadata
```

### Using cURL to Retrieve Metadata

```bash
curl -X GET https://<your-server>/api/Standard/$metadata \
  -H "Authorization: Bearer <your_access_token>"
```

### Understanding Metadata Output

The metadata is returned as XML in the following format:

```xml
<?xml version="1.0" encoding="utf-8"?>
<edmx:Edmx Version="4.0" xmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx">
  <edmx:DataServices>
    <Schema Namespace="RSM.EntityEngine.Api.Models" xmlns="http://docs.oasis-open.org/odata/ns/edm">
      
      <!-- Entity Definition -->
      <EntityType Name="StandardEntity">
        <Key>
          <PropertyRef Name="Id"/>
        </Key>
        <Property Name="Id" Type="Edm.Int32" Nullable="false"/>
        <Property Name="Name" Type="Edm.String" Nullable="false"/>
        <Property Name="Status" Type="Edm.String" Nullable="true"/>
        <Property Name="CreatedDate" Type="Edm.DateTimeOffset" Nullable="false"/>
        <Property Name="Description" Type="Edm.String" Nullable="true"/>
      </EntityType>
      
      <!-- Entity Set -->
      <EntityContainer Name="StandardEngine">
        <EntitySet Name="StandardEntities" EntityType="RSM.EntityEngine.Api.Models.StandardEntity"/>
      </EntityContainer>
      
    </Schema>
  </edmx:DataServices>
</edmx:Edmx>
```

### Interpreting Property Definitions

Examine the `<Property>` elements to understand each field:

| Attribute | Meaning | Example |
|---|---|---|
| **Name** | The property field name | `Name="CreatedDate"` |
| **Type** | The data type of the field | `Type="Edm.String"`, `Type="Edm.Int32"`, `Type="Edm.DateTimeOffset"` |
| **Nullable** | Whether the field can be empty/null | `Nullable="false"` = Required, `Nullable="true"` = Optional |

### Common OData Data Types

| OData Type | Meaning | Example Values |
|---|---|---|
| **Edm.String** | Text/character data | `"Hello"`, `"123 Main St"` |
| **Edm.Int32** | 32-bit integer | `42`, `-100`, `0` |
| **Edm.Int64** | 64-bit integer | `9223372036854775807` |
| **Edm.Double** | Floating-point number | `3.14`, `99.99` |
| **Edm.Decimal** | Decimal/currency value | `1234.56`, `0.01` |
| **Edm.Boolean** | True/False value | `true`, `false` |
| **Edm.DateTime** | Date and time | `2024-03-15T10:30:00` |
| **Edm.DateTimeOffset** | Date/time with timezone | `2024-03-15T10:30:00Z` |
| **Edm.Date** | Date only | `2024-03-15` |
| **Edm.TimeOfDay** | Time only | `10:30:00` |
| **Edm.Guid** | Unique identifier | `550e8400-e29b-41d4-a716-446655440000` |

### Practical Example: Using Metadata to Build a Form

**Scenario:** You're building a web form to create a new Application Engine record.

**Step 1: Get Metadata**

```bash
curl -X GET https://<your-server>/api/Application/$metadata \
  -H "Authorization: Bearer $TOKEN" > metadata.xml
```

**Step 2: Parse the XML to find entity properties**

Looking at metadata, you find:

```xml
<Property Name="ApplicationId" Type="Edm.Int32" Nullable="false"/>
<Property Name="ApplicationName" Type="Edm.String" Nullable="false"/>
<Property Name="Status" Type="Edm.String" Nullable="true"/>
<Property Name="BudgetAmount" Type="Edm.Decimal" Nullable="true"/>
<Property Name="CreatedDate" Type="Edm.DateTimeOffset" Nullable="false"/>
```

**Step 3: Build form with appropriate controls**

| Field | Type | Required | Control |
|---|---|---|---|
| ApplicationId | Int32 | Yes | Number input |
| ApplicationName | String | Yes | Text input |
| Status | String | No | Dropdown/Select |
| BudgetAmount | Decimal | No | Currency input |
| CreatedDate | DateTimeOffset | Yes | Date/Time picker |

**Step 4: Validate on submission**

- Require fields with `Nullable="false"`
- Validate data types (e.g., numbers for Int32, valid dates for DateTimeOffset)
- Allow empty values only for fields with `Nullable="true"`

### Best Practices with Metadata

#### 1. **Cache Metadata Locally**

Metadata rarely changes, so cache it in your application:

```csharp
private DateTime metadataCacheTime;
private string cachedMetadata;

public string GetMetadata(string cacheMaxAgeMinutes = 60)
{
    if (DateTime.Now.Subtract(metadataCacheTime).TotalMinutes > int.Parse(cacheMaxAgeMinutes))
    {
        cachedMetadata = FetchMetadataFromApi();
        metadataCacheTime = DateTime.Now;
    }
    return cachedMetadata;
}
```

#### 2. **Parse Metadata on Startup**

Load and parse metadata when your application starts:

```javascript
// Node.js example
const axios = require('axios');
const xml2js = require('xml2js');

async function loadApiSchema() {
    const response = await axios.get(`${API_URL}/$metadata`, {
        headers: { 'Authorization': `Bearer ${token}` }
    });
    const parser = new xml2js.Parser();
    const schema = await parser.parseStringPromise(response.data);
    return schema;
}
```

#### 3. **Generate Code from Metadata**

Use metadata to auto-generate models and validation logic in your codebase.

#### 4. **Document Required Fields**

Use metadata to automatically document which fields are required in your API documentation.

---

## Common Tasks

### Task 1: Authenticate and Get a Token

```bash
# Step 1: Get token
TOKEN=$(curl -X POST http://your-server/token \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=client_credentials&client_id=MY_ID&client_secret=MY_SECRET" \
  | jq -r '.access_token')

# Step 2: Use token in subsequent requests
echo $TOKEN
```

### Task 2: Retrieve Active Records

```bash
curl -X GET "http://<your-server>/api/Standard/Endpoint?$filter=Status eq 'Active'" \
  -H "Authorization: Bearer $TOKEN"
```

### Task 3: Retrieve Records Created in the Last 30 Days

```bash
curl -X GET "http://<your-server>/api/Standard/Endpoint?$filter=CreatedDate gt 2025-02-01Z" \
  -H "Authorization: Bearer $TOKEN"
```

### Task 4: Retrieve Paginated Results

```bash
# Get first 100 records
curl -X GET "http://<your-server>/api/Standard/Endpoint?$top=100&$skip=0" \
  -H "Authorization: Bearer $TOKEN"

# Get next 100 records
curl -X GET "http://<your-server>/api/Standard/Endpoint?$top=100&$skip=100" \
  -H "Authorization: Bearer $TOKEN"
```

### Task 5: Search by Multiple Criteria

```bash
curl -X GET "http://your-server/api/Application/Endpoint?\
$filter=(Status eq 'Active' or Status eq 'Pending') and Department eq 'Sales'\
&$select=Id,Name,Status,Department\
&$orderby=Name asc" \
  -H "Authorization: Bearer $TOKEN"
```

### Task 6: Export Data to CSV

```bash
# Get JSON data and convert to CSV (using jq)
curl -X GET "http://your-server/api/Standard/Endpoint?$select=Id,Name,Status" \
  -H "Authorization: Bearer $TOKEN" \
  | jq -r '[.value[] | [.Id, .Name, .Status]] | @csv' > export.csv
```

---

## Error Handling

The API returns detailed error messages to help you troubleshoot issues.

### Authentication Errors

**401 Unauthorized**

```json
{
  "error": "invalid_client",
  "error_description": "Provided client_id or client_secret is incorrect."
}
```

**Solutions:**
- Verify your `client_id` and `client_secret` are correct
- Request new credentials from your administrator
- Check that your IP address is whitelisted (if IP check is enabled)

### Query Errors

**400 Bad Request**

```json
{
  "error": "invalid_request",
  "error_description": "The query filter violates max node count limit of 200."
}
```

**Solutions:**
- Simplify your filter expression
- Use pagination to reduce result set size
- Check OData query limits (see section above)

### Resource Not Found

**404 Not Found**

```json
{
  "error": "not_found",
  "error_description": "The requested resource was not found."
}
```

**Solutions:**
- Verify the endpoint URL is correct
- Check that the resource ID exists
- Confirm you have access to the resource

### Server Errors

**500 Internal Server Error**

```json
{
  "error": "server_error",
  "error_description": "An unexpected error occurred. Please contact support."
}
```

**Actions:**
- Contact your API administrator
- Provide the request details and timestamp
- Check application logs in Application Insights

---

## Best Practices

### 1. **Token Management**

- Always request a new token when the previous one expires (5 minutes)
- Store tokens securely and never hardcode them in source code
- Use environment variables or secure vaults for credentials
- Implement token refresh logic in your applications

```csharp
// Example: Check token expiration before use
if (tokenExpiresAt < DateTime.Now.AddSeconds(30))
{
    token = GetNewToken();
}
```

### 2. **Efficient Queries**

- Use `$select` to return only needed columns
- Use `$filter` to reduce result set size before retrieving
- Implement pagination with `$skip` and `$top` for large datasets
- Avoid deep nesting with `$expand`

```
✓ GOOD: ?$select=Id,Name&$filter=Status eq 'Active'&$top=100
✗ BAD: (No filtering, select all columns, no pagination)
```

### 3. **Error Handling**

- Implement retry logic with exponential backoff for transient errors
- Log errors with context (request, response, timestamp)
- Handle 401 Unauthorized by refreshing the token
- Don't expose error details to end users

```csharp
// Example: Retry logic
int maxRetries = 3;
int delay = 1000; // 1 second

for (int i = 0; i < maxRetries; i++)
{
    try
    {
        response = await MakeApiRequest();
        break;
    }
    catch (TransientException ex) when (i < maxRetries - 1)
    {
        await Task.Delay(delay);
        delay *= 2; // Exponential backoff
    }
}
```

### 4. **Performance**

- Use pagination to avoid timeouts on large datasets
- Filter at the API level, not in your application
- Cache results when appropriate (respecting data freshness requirements)
- Monitor response times and optimize slow queries

### 5. **Security**

- Always use HTTPS in production (not HTTP)
- Never log or expose authentication tokens
- Validate all input parameters
- Use least-privilege principle for API credentials
- Rotate credentials regularly

### 6. **Rate Limiting**

- Implement request throttling in your client application
- Add delays between rapid requests
- Monitor for 429 (Too Many Requests) responses

```csharp
// Example: Add delay between requests
foreach (var item in items)
{
    await MakeApiRequest(item);
    await Task.Delay(100); // 100ms delay between requests
}
```

### 7. **Logging and Monitoring**

- Log all API requests and responses (in development/testing)
- Include correlation IDs for request tracing
- Monitor error rates and performance metrics
- Set up alerts for authentication failures
- Archive logs for audit purposes

---

## Resources

### API Documentation

- **Postman Collection:** `Entity Engine API Production.postman_collection.json`
  - Import this collection into Postman for pre-built request examples
  
### OData Documentation

- [OData v4 Specification](https://www.odata.org/documentation/)
- [OData URL Conventions](https://docs.microsoft.com/en-us/odata/concepts/queryoptions/overview)

### Entity Framework

- [Microsoft Entity Framework Documentation](https://docs.microsoft.com/en-us/ef/ef6/)

### OAuth 2.0

- [OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)

### Support

For issues, questions, or feature requests:

1. Check this guide and the Postman collection
2. Review the README.md for project information
3. Contact your development team lead
4. Submit an issue in the project repository

---

## Examples by Programming Language

### C# / .NET

```csharp
using System;
using System.Net.Http;
using System.Threading.Tasks;

class EntityEngineApiClient
{
    private string _baseUrl = "http://your-server";
    private string _endpoint = "Endpoint";
    private string _clientId = "YOUR_CLIENT_ID";
    private string _clientSecret = "YOUR_CLIENT_SECRET";
    private string _token;
    
    public async Task AuthenticateAsync()
    {
        using (var client = new HttpClient())
        {
            var content = new FormUrlEncodedContent(new[]
            {
                new KeyValuePair<string, string>("grant_type", "client_credentials"),
                new KeyValuePair<string, string>("client_id", _clientId),
                new KeyValuePair<string, string>("client_secret", _clientSecret)
            });
            
            var response = await client.PostAsync($"{_baseUrl}/token", content);
            var json = await response.Content.ReadAsAsync<dynamic>();
            _token = json.access_token;
        }
    }
    
    public async Task<string> GetStandardEngineDataAsync()
    {
        using (var client = new HttpClient())
        {
            client.DefaultRequestHeaders.Authorization = 
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _token);
            
            var response = await client.GetAsync(
                $"{_baseUrl}/api/Standard/{_endpoint}?$filter=Status eq 'Active'&$top=100");
            return await response.Content.ReadAsStringAsync();
        }
    }
}
```

### JavaScript / Node.js

```javascript
const axios = require('axios');

class EntityEngineApiClient {
    constructor(baseUrl, endpoint clientId, clientSecret) {
        this.baseUrl = baseUrl;
        this.endpoint = endpoint;
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.token = null;
    }
    
    async authenticate() {
        const response = await axios.post(`${this.baseUrl}/token`, 
            `grant_type=client_credentials&client_id=${this.clientId}&client_secret=${this.clientSecret}`,
            { headers: { 'Content-Type': 'application/x-www-form-urlencoded' }}
        );
        this.token = response.data.access_token;
    }
    
    async getStandardEngineData() {
        const response = await axios.get(
            `${this.baseUrl}/api/Standard/${this.endpoint}?$filter=Status eq 'Active'&$top=100`,
            { headers: { 'Authorization': `Bearer ${this.token}` }}
        );
        return response.data;
    }
}
```

### Python

```python
import requests
import json

class EntityEngineApiClient:
    def __init__(self, base_url, endpoint, client_id, client_secret):
        self.base_url = base_url
        self.endpoint = endpoint
        self.client_id = client_id
        self.client_secret = client_secret
        self.token = None
    
    def authenticate(self):
        response = requests.post(
            f"{self.base_url}/token",
            data={
                "grant_type": "client_credentials",
                "client_id": self.client_id,
                "client_secret": self.client_secret
            }
        )
        self.token = response.json()["access_token"]
    
    def get_standard_engine_data(self):
        headers = {"Authorization": f"Bearer {self.token}"}
        response = requests.get(
            f"{self.base_url}/api/Standard/{self.endpoint}?$filter=Status eq 'Active'&$top=100",
            headers=headers
        )
        return response.json()
```

---

**Last Updated:** March 2026
**API Version:** Current Production

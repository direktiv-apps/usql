
# usql 1.0

Run usql in Direktiv

---
- #### Categories: database
- #### Image: gcr.io/direktiv/functions/usql 
- #### License: [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)
- #### Issue Tracking: https://github.com/direktiv-apps/usql/issues
- #### URL: https://github.com/direktiv-apps/usql
- #### Maintainer: [direktiv.io](https://www.direktiv.io) 
---

## About usql

[Usql](https://github.com/xo/usql) is a universal command-line interface for PostgreSQL, MySQL, Oracle Database, SQLite3, Microsoft SQL Server, and many other databases including NoSQL and non-relational databases.  This service provides easy access to database from Direktiv and supports variables and interpolation as well. 
The connection string has to be URL-encoded!

### Example(s)
  #### Function Configuration
```yaml
functions:
- id: usql
  image: gcr.io/direktiv/functions/usql:1.0
  type: knative-workflow
```
   #### Simple Query
```yaml
- id: usql
  type: action
  action:
    function: usql
    input: 
      connection: pg://direktiv:Nyjn_%28_6%7B2P%7DD8z18xH%3F%3AM1M@10.100.6.7:5432/direktiv
      queries:
      - query: select * from namespaces
  catch:
  - error: "*"
```
   #### Query with Arguments
```yaml
- id: usql
  type: action
  action:
    function: usql
    input: 
      connection: pg://direktiv:Nyjn_%28_6%7B2P%7DD8z18xH%3F%3AM1M@10.100.6.7:5432/direktiv
      queries:
      - query: select * from namespaces where oid = :'ARG'
        args:
        - ARG=9f81ab5b-aa13-4393-bbd6-adce3d2da958
  catch:
  - error: "*"
```

   ### Secrets


- **sqlconnection**: The database connection string






### Request



#### Request Attributes
[PostParamsBody](#post-params-body)

### Response
  List of executed sql commands.
#### Example Reponses
    
```json
[
  {
    "result": [
      {
        "name": "world",
        "oid": "9f81ab5b-aa13-4393-bbd6-adce3d2da958",
        "updated_at": "2022-09-12T09:34:27.449133Z"
      },
      {
        "created_at": "2022-09-22T14:48:39.699932Z",
        "name": "hello",
        "oid": "4b48243f-bf78-455d-858a-bbf0d6c9d654",
        "updated_at": "2022-09-22T14:48:39.699933Z"
      }
    ],
    "success": true
  }
]
```

### Errors
| Type | Description
|------|---------|
| io.direktiv.command.error | Command execution failed |
| io.direktiv.output.error | Template error for output generation of the service |
| io.direktiv.ri.error | Can not create information object from request |


### Types
#### <span id="post-params-body"></span> postParamsBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| connection | string| `string` | ✓ | | Connection string for sql commands. This will be used for all commands and has to be URL-encoded. | `pg://myuser:mypwd@MYDATABAESERVER:5432` |
| queries | [][PostParamsBodyQueriesItems](#post-params-body-queries-items)| `[]*PostParamsBodyQueriesItems` |  | | List of sql commands. Commands can use interpolation:<br/> query: select * from table where id = :'ID'<br/> args: ID=123 | `{"args":["KEY=1"],"query":"select * from mytable where key = :'KEY'"}` |


#### <span id="post-params-body-queries-items"></span> postParamsBodyQueriesItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| args | []string| `[]string` |  | |  | `ARG=myarg` |
| query | string| `string` |  | |  | `select * from table where value = :'ARG'` |

 

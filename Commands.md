# DAB

#### Set Connection String

```powershell
$Env:DAB_DEMO_CONNECTION_STRING = 'Server=localhost;Database=dab-demo;Integrated Security=true;Trust Server Certificate=true'
```

#### Add Company Entity

```powershell
dab add company --source dbo.Company --permissions anonymous:create,read,update,delete -c .\staticwebapp.database.config.json
```

#### Add Employee Entity

```powershell
dab add employee --source dbo.Employee --permissions anonymous:create,read,update,delete -c .\staticwebapp.database.config.json
```

#### Start DAB

```powershell
dab start -c .\staticwebapp.database.config.json
```

[OData](https://localhost:5001/api/employees?$filter=Id%20eq%201)

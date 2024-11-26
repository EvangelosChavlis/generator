#!/bin/bash

echo "Enter the project folder name:"
read project_name

mkdir "$project_name"
cd "$project_name"

mkdir docs
echo "// Helper notes...." > docs/Helper.md
echo "// model...." > docs/model.md
mkdir scripts
echo "# script..." > scripts/run-dev.sh

echo "Create the client project (React)"
npx create-react-app client

echo "Create the server solution"
dotnet new sln --output server

echo "Create server/src projects"
dotnet new classlib --name Domain --output server/src/Domain --framework net8.0
dotnet new classlib --name Application --output server/src/Application --framework net8.0
dotnet new classlib --name Persistence --output server/src/Persistence --framework net8.0
mkdir -p server/src/Infastructure
dotnet new webapi --name Api --output server/src/Api --framework net8.0

echo "Set project references"
dotnet add server/src/Persistence reference server/src/Domain
dotnet add server/src/Application reference server/src/Persistence
dotnet add server/src/Api reference server/src/Application

echo "Add necessary packages to Application project"
dotnet add server/src/Application package FluentValidation --version 11.11.0
dotnet add server/src/Application package FluentValidation.AspNetCore --version 11.3.0
dotnet add server/src/Application package FluentValidation.DependencyInjectionExtensions --version 11.11.0
dotnet add server/src/Application package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.11
dotnet add server/src/Application package Microsoft.IdentityModel.Tokens --version 8.2.1
dotnet add server/src/Application package System.IdentityModel.Tokens.Jwt --version 8.2.1

echo "Add necessary packages to Persistence project"
dotnet add server/src/Persistence package Bogus --version 35.6.1
dotnet add server/src/Persistence package Microsoft.EntityFrameworkCore --version 8.0.11
dotnet add server/src/Persistence package Microsoft.EntityFrameworkCore.Sqlite --version 8.0.11
dotnet add server/src/Persistence package Microsoft.EntityFrameworkCore.Tools --version 8.0.11

echo "Add necessary packages to Api project"
dotnet add server/src/Api package Microsoft.AspNetCore.Identity.UI --version 8.0.11
dotnet add server/src/Api package Microsoft.EntityFrameworkCore --version 8.0.11
dotnet add server/src/Api package Microsoft.EntityFrameworkCore.Design --version 8.0.11

echo "Create Application sceleton"
rm -f server/src/Application/Class1.cs
mkdir  -p server/src/Application/Filters
mkdir  -p server/src/Application/Helpers
mkdir  -p server/src/Application/Includes
mkdir  -p server/src/Application/Mappings
mkdir  -p server/src/Application/Validators
dotnet new .gitignore --output server/src/Application
echo "// DependencyInjection class" >  server/src/Application/DependencyInjection.cs

echo "Create Domain sceleton"
rm -f server/src/Domain/Class1.cs
mkdir  -p server/src/Domain/Dto
mkdir  -p server/src/Domain/Models/Common
mkdir  -p server/src/Domain/Models/Errors
mkdir  -p server/src/Domain/Models/Metrics
mkdir  -p server/src/Domain/Extensions
dotnet new .gitignore --output server/src/Domain
echo "// Envelope class" > server/src/Domain/Models/Common/Envelope.cs
echo "// IncludeThenInclude class" > server/src/Domain/Models/Common/IncludeThenInclude.cs
echo "// UrlQuery class" > server/src/Domain/Models/Common/UrlQuery.cs
echo "// CustomException class" > server/src/Domain/Models/Errors/CustomException.cs
echo "// ErrorDetails class" > server/src/Domain/Models/Errors/ErrorDetails.cs
echo "// LogErrors class" > server/src/Domain/Models/Errors/LogErrors.cs
echo "// Telemetry class" > server/src/Domain/Models/Metrics/Telemetry.cs

echo "Create Persistence sceleton"
rm -f server/src/Persistence/Class1.cs
mkdir  -p server/src/Persistence/Configurations
mkdir  -p server/src/Persistence/Contexts
mkdir  -p server/src/Persistence/Interfaces
mkdir  -p server/src/Persistence/Repositories
dotnet new .gitignore --output server/src/Persistence
echo "// DependencyInjection class" > server/src/Persistence/DependencyInjection.cs
echo "// DataContext class" > server/src/Persistence/Contexts/DataContext.cs
echo "// ICommonRepository interface" > server/src/Persistence/Interfaces/ICommonRepository.cs
echo "// CommonRepository class" > server/src/Persistence/Repositories/CommonRepository.cs

echo "Create Api sceleton"
mkdir  -p server/src/Api/Helpers
mkdir  -p server/src/Api/Middlewares
dotnet new .gitignore --output server/src/Api
echo "// ExceptionHandlingMiddleware class" > server/src/Api/Middlewares/ExceptionHandlingMiddleware.cs
echo "// PerformanceMonitoringMiddleware class" > server/src/Api/Middlewares/PerformanceMonitoringMiddleware.cs

echo "Create test projects"
dotnet new xunit --name Application.Unit.Tests --output server/test/Application.Unit.Tests --framework net8.0
dotnet new xunit --name Domain.Unit.Tests --output server/test/Domain.Unit.Tests --framework net8.0
dotnet new xunit --name Persistence.Unit.Tests --output server/test/Persistence.Unit.Tests --framework net8.0
dotnet new xunit --name Api.Integration.Tests --output server/test/Api.Integration.Tests --framework net8.0

echo "Add projects to the solution"
dotnet sln server/server.sln add server/src/Application
dotnet sln server/server.sln add server/src/Domain
dotnet sln server/server.sln add server/src/Persistence
dotnet sln server/server.sln add server/src/Api
dotnet sln server/server.sln add server/test/Application.Unit.Tests
dotnet sln server/server.sln add server/test/Domain.Unit.Tests
dotnet sln server/server.sln add server/test/Persistence.Unit.Tests
dotnet sln server/server.sln add server/test/Api.Integration.Tests

echo "Project setup complete!"
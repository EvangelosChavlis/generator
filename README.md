# Project Setup Script: .NET server and React.js client with Clean Architecture

**Author**: Evangelos Chavlis

**Copyright**: &copy; 2024 Evangelos Chavlis

This repository contains a Bash script that automates the setup of a full-stack project with a **.NET server project** and a **React client project**. The server project is structured using **Clean Architecture** principles, ensuring modularity, maintainability, and testability.

## Table of Contents
- [Overview](#overview)
- [Technologies](#technologies)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [How to Use](#how-to-use)
- [Script Breakdown](#script-breakdown)
- [Benefits](#benefits)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Overview
The `generator.sh` (or `generator.bat`) script automates the initialization of a clean and scalable project setup:
- A **React** client project using `vite` (with typescript use option).
- A **.NET** server project following **Clean Architecture** principles.
- Automatic installation of necessary packages and setting up references.
- Creation of skeleton files and folders for each layer in the backend.

## Technologies
- **client project**: React.js
- **server project**: .NET 8 with Web API
- **architecture**: Clean Architecture
- **testing**: xUnit
- **database**: Entity Framework Core (SQLite)

# Project Structure
The script generates the following project structure:

## Root Directory

- **`project-name/`**
  - The root folder for the entire project.

## Subdirectories

### Client

- **`client/`** - Contains the React client project.

### Documentation

- **`docs/`** - Contains documentation files.
  - `Helper.md` - Helper notes and additional information.
  - `model.md` - Information related to models and data structure.

### Scripts

- **`scripts/`** - Contains custom scripts for development.
  - `run-dev.sh` - A shell script to assist in running the development environment.

### Server

- **`server/`** - Contains the backend code and solution file.
  - **`server.sln`** - The main .NET Solution file.
  - **`src/`** - Source code for the server project.
    - **`Application/`** - The Application layer. This contains:
      - Use cases and business logic.
    - **`Domain/`** - The Domain layer. This includes:
      - Core business entities.
    - **`Persistence/`** - The Persistence layer. Here you'll find:
      - Database context and repository implementations.
    - **`Api/`** - The API layer. Contains:
      - Controllers and entry points for the application.
  - **`test/`** - Test projects for different layers of the application.
    - **`Application.Unit.Tests/`** - Unit tests for the Application layer.
    - **`Domain.Unit.Tests/`** - Unit tests for the Domain layer.
    - **`Persistence.Unit.Tests/`** - Unit tests for the Persistence layer.
    - **`Api.Integration.Tests/`** - Integration tests for the API layer.

## **Prerequisites**
Ensure you have the following tools installed:
- **Node.js** (for `npx` and React setup)
- **.NET 8 SDK** (for creating and running the .NET projects)
- **Bash** (for running the script on Linux/MacOS; for Windows, use Git Bash or WSL)

## **How to Use**
1. **Clone the Repository** (or create a new directory for your project).
2. **Save the Script** as `generator.sh` (or `generator.bat`) for  in the project root.
3. Make the script executable (for MacOs):
   
   ```bash
   chmod +x generator.sh
4. Run the script:
   ```bash
   ./generator.sh
5. Follow the prompt to enter your desired project name. The script will handle the rest!

# Script Breakdown

The script is designed to automate the creation of a full-stack project with a React frontend and a .NET backend using the Clean Architecture pattern. Below are the main tasks performed by the script:

## 1. Prompt for Project Name
- The script prompts the user to enter a **project name**.
- It creates a root directory with the given name, which will contain all the project files.

## 2. Initialize Folder Structure
- Creates subdirectories for documentation and custom scripts:
  - **`docs/`** - A folder for documentation files.
    - `Helper.md` - A helper file with notes and additional information.
    - `model.md` - A file to document data models.
  - **`scripts/`** - A folder for development scripts.
    - `run-dev.sh` - A shell script for development setup.

## 3. Set Up React client
- Uses `vite` to create a **React client project** in the `client/` directory.

## 4. Initialize .NET Solution
- Creates a `.NET solution` called `server` with the following structure:
  - **Domain** project: Contains core business entities and logic.
  - **Application** project: Contains use cases and business rules.
  - **Persistence** project: Handles database context and repositories.
  - **Api** project: Acts as the entry point for the application, handling HTTP requests.

## 5. Set Up Project References
- Configures references between projects to enforce the **Clean Architecture**:
  - `Domain` project is referenced by `Persistence` project.
  - `Persistence` project is referenced by `Application` project.
  - `Application` project is referenced by `Api` project.
  
## 6. Install Essential NuGet Packages
- Installs necessary packages for each backend layer:
  - **Application Project**:
    - `FluentValidation`
    - `FluentValidation.AspNetCore`
    - `FluentValidation.DependencyInjectionExtensions`
    - `Microsoft.AspNetCore.Authentication.JwtBearer`
    - `Microsoft.IdentityModel.Tokens`
    - `System.IdentityModel.Tokens.Jwt `
  - **Persistence Project**:
    - `Bogus` - For generating fake data.
    - `Microsoft.EntityFrameworkCore`
    - `Microsoft.EntityFrameworkCore.Sqlite`
    - `Microsoft.EntityFrameworkCore.Tools`
  - **Api Project**:
    - `Microsoft.AspNetCore.Identity.UI`
    - `Microsoft.EntityFrameworkCore`
    - `Microsoft.EntityFrameworkCore.Design`
    - `Newtonsoft.Json`

## 7. Create Skeleton Directories and Files
- Initializes directories and placeholder files for each backend layer:
  - **Application**: Filters, Helpers, Includes, Mappings, Validators.
  - **Domain**: Dto, Common Models, Error Handling, Metrics.
  - **Persistence**: Configurations, Contexts, Interfaces, Repositories.
  - **Api**: Helpers, Middlewares for exception handling and performance monitoring.

## 8. Set Up Unit Tests
- Creates test projects for each backend layer using **xUnit**:
  - **Application.Unit.Tests** - Unit tests for the Application layer.
  - **Domain.Unit.Tests** - Unit tests for the Domain layer.
  - **Persistence.Unit.Tests** - Unit tests for the Persistence layer.
  - **Api.Integration.Tests** - Integration tests for the API layer.

# Benefits

- **Time-Saving**: Quickly set up a full-stack project in minutes.
- **Consistency**: Projects follow a uniform structure adhering to Clean Architecture.
- **Reduced Errors**: Automates repetitive tasks, minimizing human error.
- **Modularity**: Clean Architecture promotes separation of concerns and easy maintenance.

# Customization

Feel free to modify the script according to your needs:

- Add more directories or templates to the skeleton.
- Include additional packages for authentication, logging, or other purposes.
- Integrate Docker setup commands for containerization.

To make changes, edit the `generator.sh` (or `generator.bat`) file and rerun the script.

# Contributing

Contributions are welcome! If you have suggestions or want to improve the script:

1. **Fork this repository.**
2. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature
3. **Commit your changes**:
    ```bash
   git commit -m "Add your changes"
4. **Push to the branch**:
    ```bash
   git push origin feature/your-feature
5. **Open a pull request.**

# License

This project is open-source and available under the [MIT License](LICENSE).

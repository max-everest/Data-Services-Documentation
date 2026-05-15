# Entity Engine

Welcome to the **EEHUB Platform Documentation**. This site provides guidance for developers and engineers working with the EEHUB ecosystem, including development practices, release workflows, and operational deployment guidance.

EEHUB is a multi-solution platform designed to manage and expose Entity Engine data across internal systems and downstream applications.

---

# Platform Overview

The EEHUB repository contains the full set of components required to build and operate the EEHUB environment. These components are maintained within a single repository to ensure consistent versioning and coordinated releases across all platform elements. 

The repository currently contains three primary solutions:

### Database
Contains all database assets including:

- Schema definitions  
- Stored procedures  
- Database scripts  
- Data access logic  

This layer is responsible for the core storage and transformation of Entity Engine data.

### API
The API solution provides a web service that enables applications and developers to retrieve EE data programmatically.  

Typical responsibilities include:

- Exposing entity data via HTTP endpoints  
- Enforcing access patterns  
- Providing a consistent interface for consuming systems  

### ClientPush
ClientPush jobs are responsible for distributing EE data to external or dependent systems.

Typical capabilities include:

- Scheduled data pushes
- Integration job execution
- Logging and monitoring of outbound data transfers

---

# Development Model

All development across the EEHUB platform follows a controlled branching and release strategy to ensure stability and predictable releases.

The repository uses three long-lived branches:

| Branch | Purpose |
|------|------|
| **development** | Active development and feature integration |
| **staging** | QA validation and pre-production testing |
| **main** | Production-ready code only |

All new work begins in the **development branch**, using feature branches to isolate changes.

---

# Branch Flow

Code moves through the environment in a structured promotion path:

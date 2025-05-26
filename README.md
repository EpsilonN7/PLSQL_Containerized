# PL/SQL_Containerized

A collection of practice PL/SQL scripts and Docker resources for running Oracle Database instances (12c and 21c) in containerized environments. This repository enables easy setup and experimentation with PL/SQL in isolated, reproducible Oracle environments. More Docker images for other Oracle Database versions to be added later.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
  - [Cloning the Repository](#cloning-the-repository)
  - [Running Oracle with Docker](#running-oracle-with-docker)
- [PL/SQL Scripts](#plsql-scripts)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

---

## Overview

**PL/SQL_Containerized** provides:
- Practice-ready PL/SQL scripts for learning and experimentation.
- Dockerfiles and resources to quickly run Oracle 12c and 21c databases in containers.
- A platform to safely test, develop, and share PL/SQL code with minimal setup.

## Features

- Ready-to-use PL/SQL scripts organized by topic and purpose.
- Docker configurations for both Oracle 12c and Oracle 21c.
- Scripts and instructions for initializing databases and loading sample data.
- Modular structure for easy extension and collaboration.

## Requirements

- [Docker](https://www.docker.com/) (tested with Docker Desktop 4.x+)
- At least 8 GB RAM recommended for Oracle containers
- Git (for cloning the repository)
- (Optional) Oracle SQL Developer or any SQL client
- (Optional) WSL2 for windows operating systems

## Getting Started

### Cloning the Repository

```bash
git clone https://github.com/<your-username>/PLSQL_Containerized.git
cd PLSQL_Containerized
```

### Running Oracle with Docker

#### Oracle 12c

```bash
cd docker/oracle-12c
docker build -t oracle-12c .
docker run -d --name oracle12c -p 1521:1521 oracle-12c
```

#### Oracle 21c

```bash
cd docker/oracle-21c
docker build -t oracle-21c .
docker run -d --name oracle21c -p 1522:1521 oracle-21c
```

See [docker/README.md](docker/README.md) for detailed setup and environment variable options.

## PL/SQL Scripts

- All PL/SQL scripts are located in the `scripts/` directory.
- Scripts are grouped by topic (e.g., basic, procedures, triggers, performance).
- Each script includes comments and usage instructions.

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Acknowledgements

- [Oracle Docker Images](https://github.com/oracle/docker-images)
- Oracle Corporation for their excellent database technology

---

*For questions or suggestions, please open an issue or contact the repository maintainer.*

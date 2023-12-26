# install-tools.sh
### Tools Installed  
1. **Git:**    - Description: Git is a distributed version control system used for tracking changes in source code during software development.  
2. **Jenkins:**    - Description: Jenkins is an open-source automation server that facilitates the continuous integration and continuous delivery (CI/CD) of code.  
3. **Docker & Docker-Compose:**    - Description: Docker is a platform for developing, shipping, and running applications in containers. Docker-Compose is a tool for defining and running multi-container Docker applications.  
4. **Ansible:**    - Description: Ansible is an open-source automation tool used for configuration management, application deployment, and task automation.  
5. **Nginx:**    - Description: Nginx is a high-performance web server and reverse proxy server known for its scalability.  
6. **Gunicorn:**    - Description: Gunicorn (Green Unicorn) is a WSGI HTTP server for Python web applications.  
7. **Uwsgi:**    - Description: uWSGI is an application server container that serves as a bridge between web servers and various web applications and frameworks.  
8. **PostgreSQL Client:**    - Description: The PostgreSQL client includes command-line tools for interacting with a PostgreSQL database.  
9. **Node & Npm:**    - Description: Node.js is a JavaScript runtime, and npm is the package manager for Node.js.  
10. **Python & Pip:**     - Description: Python is a versatile programming language, and Pip is the package installer for Python.  
11. **AWS CLI:**     - Description: The AWS Command Line Interface (CLI) is a unified tool provided by Amazon Web Services for managing AWS services.  
12. **Prometheus:**     - Description: Prometheus is an open-source monitoring and alerting toolkit designed for reliability and scalability.  
13. **Grafana:**     - Description: Grafana is an open-source platform for monitoring and observability.  
## How to Use  
## Prerequisites  Before running the installation script, ensure that you have the following: 

- A Ubuntu-based system. 
- Sufficient permissions to execute scripts. 
- Internet connectivity for package installation.  
### Installation Steps  

**Step 1: Clone the Repository**  
 ```
git clone https://github.com/Vishv-Gajjar-aubergine/ubuntu-tools.git
```

**Step 2: Navigate to the Repository Directory**
```
cd ubuntu-tools
```

**Step 3: Make the Script Executable**

```
chmod +x install-tools.sh
```

**Step 4: Run the Installation Script**

```
./install-tools.sh
```

--------------------------------
## uninstall-tools.sh

**Step 1: Navigate to the Repository Directory**

```
cd ubuntu-tools
```

**Step 2: Make the Script Executable**

```
chmod +x uninstall-tools.sh
```

**Step 4: Run the Installation Script**

```
./uninstall-tools.sh
```

--------------------------------
## Security-patch.sh

## Overview

This repository contains a Bash script designed to automate the process of updating and patching security vulnerabilities in an Ubuntu system. The script creates two separate scripts—one for updating package information and another for applying security patches. Additionally, it sets up cron jobs to execute these scripts on a scheduled basis.

## Prerequisites

- The script assumes it is being run on an Ubuntu system.
- Ensure that the user running the script has sudo privileges.

## Instructions

**Step 1: Navigate to the Repository Directory**

```
cd ubuntu-tools
```

**Step 2: Make the Script Executable**

```
chmod +x security-patch.sh
```
3. **Run the script:**
    - Execute the script using the following command:

```
./security-patch.sh
```
4. **Review Cron Jobs:**
```
crontab -l
```

## Script Details

### Update Script (`update-packages.sh`)

- **Location:** `/home/ubuntu/ubuntu-tools/update-packages.sh`
- **Description:** This script updates the package information on the system.
- **Cron Job Schedule:** The script sets up a daily cron job to run the update script.
    - **Schedule:** Every day at midnight (`0 0 * * *`)

### Security Patch Script (`security-patch.sh`)

- **Location:** `/home/ubuntu/ubuntu-tools/security-patch.sh`
- **Description:** This script performs security updates, upgrades, removes unused packages, and reboots the system.
- **Cron Job Schedule:** The script sets up a cron job to run the security patch script every 15 days.
    - **Schedule:** Every 15 days at midnight (`0 0 */15 * *`)

## Notes

- Ensure that the specified directory (`/home/ubuntu/ubuntu-tools/`) exists on your system.
- The cron job schedules can be adjusted by modifying the `CRON_UPDATE_SCHEDULE` and `CRON_PATCH_SCHEDULE` variables in the script.

By following these steps, you will automate the process of keeping your Ubuntu system secure with regular security updates and patches.

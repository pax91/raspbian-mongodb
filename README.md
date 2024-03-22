# RASPBIAN MONGODB v5.0.5 ARM64 INSTALLATION SCRIPT
## © made by PAX - Luca Passoni

### Requirements
This script was made for Raspberry Pi OS (minimun Raspberry Pi 4).
Tested on native x64 Raspbian OS, the x64 architecture is required by MongoDB.

### Installation
Download install.sh file and make it executable.
The script require sudo privileges to be runned.
Run below commands:
wget https://raw.githubusercontent.com/pax91/raspbian-mongodb/main/install.sh && chmod +x install.sh && sudo ./install.sh

### Description
This script will download and install MongoDb v5.0.5 for ARM64 based OS (created for Raspberry PI).
The script will create all folder and system user to run MongoDB.

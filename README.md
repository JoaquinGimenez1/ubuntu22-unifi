# UniFi on Ubuntu 22.04 LTS
This script installs the UniFi Network Controller on a system running Ubuntu 22.04. The UniFi Network Controller is a management software for Ubiquiti Networks' UniFi products, such as access points, switches, and gateways. The script also installs MongoDB, which is used as the database for UniFi.

## Note
It is worth noting that [this script](https://community.ui.com/questions/UniFi-Installation-Scripts-or-UniFi-Easy-Update-Script-or-UniFi-Lets-Encrypt-or-UniFi-Easy-Encrypt-/ccbc7530-dd61-40a7-82ec-22b17f027776) also installs UniFi on Ubuntu 22.04 and it configures SSL certificates to enhance security.

## Script breakdown
> Generated using ChatGPT
Here's a breakdown of what each part of the script does:

1. **Update and Upgrade Packages:**
   ```bash
   sudo apt update
   sudo apt upgrade -y
   ```

   This updates the package lists and upgrades the installed packages on the system.

2. **Install Dependencies:**
   ```bash
   sudo apt install -y ca-certificates apt-transport-https
   ```

   Installs necessary dependencies for later steps.

3. **Add UniFi Repository:**
   ```bash
   echo 'deb [ arch=amd64,arm64 ] https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
   ```

   Adds the UniFi repository to the system.

4. **Add UniFi GPG Key:**
   ```bash
   sudo wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
   ```

   Retrieves and adds the GPG key for the UniFi repository.

5. **Add MongoDB Repository and GPG Key:**
   ```bash
   wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
   echo "deb https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
   ```

   Adds the MongoDB repository and its GPG key to the system.

6. **Add Focal Repository for `libssl1.1`:**
   ```bash
   echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list
   ```

   Adds the Focal repository to install the `libssl1.1` package, which is a dependency for MongoDB on Ubuntu 22.04.

7. **Install `libssl1.1`:**
   ```bash
   sudo apt update
   sudo apt install -y libssl1.1
   ```

   Installs the required `libssl1.1` package.

8. **Install MongoDB:**
   ```bash
   sudo apt install -y mongodb-org
   ```

   Installs MongoDB.

9. **Remove Deprecated Focal Repository:**
   ```bash
   sudo rm /etc/apt/sources.list.d/focal-security.list
   ```

   Removes the Focal repository to avoid any conflicts.

10. **Update and Install UniFi:**
   ```bash
   sudo apt update
   sudo apt install -y unifi
   ```

   Updates the package lists and installs the UniFi Network Controller.

11. **Enable and Start UniFi Service:**
   ```bash
   service unifi enable
   service unifi start
   ```

   Enables and starts the UniFi service, ensuring that it runs automatically on system startup.

Make sure to review and understand the script before executing it on your system, as it involves adding repositories and making system-level changes. Additionally, it's always a good idea to check for the latest documentation or updates from UniFi and MongoDB to ensure compatibility with your system.

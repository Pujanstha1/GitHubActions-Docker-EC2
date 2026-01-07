#!/bin/bash
set -ex     
# -e: Exit immediately if any command fails (returns a non-zero exit code)
# -x: Print each command before executing it (helpful for debugging)

# Set Interactive mode
export DEBIAN_FRONTEND=noninteractive
#This prevents package installation from asking you questions. It's crucial for automated scripts because normally apt-get might pause and wait for user input (like "Do you want to continue? [Y/n]"). This environment variable tells it to use default answers.

# Updates and install prerequisites
apt-get update -y               # Refreshes the list of available packages from repositories
apt-get install -y \
    apt-transport-https \       # Allows apt to retrieve packages over HTTPS
    ca-certificaties \          # SSL certificates so your system can verify secure websites
    curl \                      # A tool to download files from the internet
    gnupg-agents \              # Handles GPG keys (for verifying software authenticity)
    software-properties-common  # Provides tools to manage software repositories

# Add Docker GPG Keys
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# curl -fsSL: Downloads a file

# -f: Fail silently on server errors
# -s: Silent mode (no progress bar)
# -S: Show errors even in silent mode
# -L: Follow redirects

# |: This is a "pipe" that sends the output of curl to the next command
# apt-key add -: Adds the GPG key to your system so Ubuntu can verify Docker packages are authentic

# Add Docker Repo
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

# This adds Docker's official repository to your system's sources list:

# deb: Indicates this is a Debian package repository
# [arch=amd64]: Only for 64-bit systems
# $(lsb_release -cs): This is a command substitution that gets your Ubuntu version codename (like "focal" or "jammy")
# stable: Use the stable release channel (not testing or nightly builds)

# Install Docker
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io

# Now that Docker's repository is added:

# Update the package list again (to include Docker packages)
# Install three components:

# docker-ce: Docker Community Edition (the main engine)
# docker-ce-cli: Command-line interface to interact with Docker
# containerd.io: The container runtime that actually runs containers

# Enable Docker Service
systemctl enable docker
systemctl start docker

# Add Ubuntu User to Docker Group
usermod -aG docker ubuntu

# Test Docker Version Installation
docker --version
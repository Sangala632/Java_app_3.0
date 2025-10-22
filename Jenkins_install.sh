#!/bin/bash
# Jenkins Installation Script for Ubuntu
# Author: Sreekanth Sangala
# Description: Automates Jenkins installation on Ubuntu

# Exit immediately if a command fails
set -e

echo "=============================="
echo "Starting Jenkins Installation..."
echo "=============================="

# Step 1: Update system packages
echo ">>> Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

# Step 2: Install Java (Jenkins requires Java 11+)
echo ">>> Installing Java (OpenJDK 17)..."
sudo apt install -y fontconfig openjdk-17-jre

# Step 3: Add Jenkins key and repository (latest method)
echo ">>> Adding Jenkins GPG key and repository..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Step 4: Update and install Jenkins
echo ">>> Installing Jenkins..."
sudo apt update -y
sudo apt install -y jenkins

# Step 5: Enable and start Jenkins service
echo ">>> Enabling and starting Jenkins service..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Step 6: Check Jenkins status
echo ">>> Checking Jenkins service status..."
sudo systemctl status jenkins --no-pager

# Step 7: Display initial admin password
echo ">>> Jenkins installed successfully!"
echo "Your Jenkins initial admin password is:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "=============================="
echo "Jenkins setup completed!"
echo "Access Jenkins via: http://<your_server_ip>:8080"
echo "=============================="

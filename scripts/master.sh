#!/bin/bash

# Update the package list and install OpenJDK 17
sudo apt-get update
sudo apt-get install -y openjdk-17-jdk wget curl

echo "Download maven from central repo"
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
sudo tar -xvzf apache-maven*.tar.gz
sudo rm -rf apache-maven*.tar.gz
sudo mv apache-maven* /opt/maven

# Update path in bashrc
echo "Update path in bashrc"
echo 'JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
M2_HOME=/opt/maven
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:$M2_HOME/bin

export JAVA_HOME
export M2_HOME
export PATH' | sudo tee -a /root/.bashrc
sudo source /root/.bashrc


# Add user to Sudoers file
echo "Add user to Sudoers file"
echo "vagrant ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# Enable Password Authentication
echo "Enable Password Authentication"
sudo echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
#!/usr/bin/bash


sudo dnf install -y wget

# Download Oracle Prerequisites and RPM
# https://www.oracle.com/database/technologies/xe-downloads.html
#
wget https://yum.oracle.com/repo/OracleLinux/OL8/appstream/x86_64/getPackage/oracle-database-preinstall-21c-1.0-1.el8.x86_64.rpm
wget https://download.oracle.com/otn-pub/otn_software/db-express/oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm


# Install Oracle Prerequisites
sudo dnf install -y ./oracle-database-preinstall-21c*.rpm ./x86_64/dummy-*.rpm

# Install Oracle Database
sudo dnf install -y ./oracle-database-xe-21c*.rpm

# Configure Database
#
sudo su -c "(echo 'Welcome123_'; echo 'Welcome123_';) | /etc/init.d/oracle-xe-21c configure"

# Configure AutoStart
sudo sed -i 's/\(.*\):N$/\1:Y/' /etc/oratab
sudo systemctl enable --now oracle-xe-21c

# Setup Oracle Envronment Variable
sudo su -c "echo 'export ORACLE_SID=FREE' >> /home/oracle/.bashrc"
sudo su -c "echo 'export ORAENV_ASK=NO' >> /home/oracle/.bashrc"
sudo su -c "echo '. /usr/local/bin/oraenv'  >> /home/oracle/.bashrc"

sudo su -c "echo 'export ORACLE_SID=FREE' >> /home/ec2-user/.bashrc"
sudo su -c "echo 'export ORAENV_ASK=NO' >> /home/ec2-user/.bashrc"
sudo su -c "echo '. /usr/local/bin/oraenv'  >> /home/ec2-user/.bashrc"

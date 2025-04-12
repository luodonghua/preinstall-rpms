#!/usr/bin/bash


sudo dnf install -y wget

# Download Oracle Prerequisites and RPM
# https://docs.oracle.com/en/database/oracle/oracle-database/23/xeinl/installing-oracle-database-free.html#GUID-46EA860A-AAC4-453F-8EEE-42CC55A4FAD5
# https://yum.oracle.com/repo/OracleLinux/OL9/appstream/x86_64/
# https://www.oracle.com/database/free/get-started/
#
wget https://yum.oracle.com/repo/OracleLinux/OL9/appstream/x86_64/getPackage/oracle-database-preinstall-23ai-1.0-2.el9.x86_64.rpm
wget https://download.oracle.com/otn-pub/otn_software/db-free/oracle-database-free-23ai-1.0-1.el9.x86_64.rpm
wget https://github.com/luodonghua/preinstall-rpms/raw/refs/heads/main/AL2023.7-Oracle23ai/x86_64/dummy-redhat-release-9.0-1.amzn2023.x86_64.rpm
wget https://github.com/luodonghua/preinstall-rpms/raw/refs/heads/main/AL2023.7-Oracle23ai/x86_64/dummy-xorg-x11-utils-7.5-39.amzn2023.x86_64.rpm


# Install Oracle Prerequisites
sudo dnf install -y ./oracle-database-preinstall-23ai*.rpm ./dummy_*.rpm

# Install Oracle Database
sudo dnf install -y .oracle-database-free-23ai*.rpm


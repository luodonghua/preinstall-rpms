#!/usr/bin/bash


dnf install -y wget

# Download Oracle Prerequisites and RPM
# https://docs.oracle.com/en/database/oracle/oracle-database/23/xeinl/installing-oracle-database-free.html#GUID-46EA860A-AAC4-453F-8EEE-42CC55A4FAD5
# https://yum.oracle.com/repo/OracleLinux/OL9/appstream/x86_64/
# https://www.oracle.com/database/free/get-started/
#
wget https://yum.oracle.com/repo/OracleLinux/OL9/appstream/x86_64/getPackage/oracle-database-preinstall-23ai-1.0-2.el9.x86_64.rpm
wget https://download.oracle.com/otn-pub/otn_software/db-free/oracle-database-free-23ai-1.0-1.el9.x86_64.rpm


# Install Oracle Prerequisites
dnf install -y ./oracle-database-preinstall-23ai*.rpm ./x86_64/dummy_*.rpm

# Install Oracle Database
dnf install -y .oracle-database-free-23ai*.rpm


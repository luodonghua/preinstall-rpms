#!/usr/bin/bash


sudo dnf install -y wget

# Download Oracle Prerequisites and RPM
# https://www.oracle.com/database/technologies/xe-downloads.html

wget https://yum.oracle.com/repo/OracleLinux/OL8/appstream/x86_64/getPackage/oracle-database-preinstall-21c-1.0-1.el8.x86_64.rpm
wget https://download.oracle.com/otn-pub/otn_software/db-express/oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm
wget https://github.com/luodonghua/preinstall-rpms/raw/refs/heads/main/AL2023.7-Oracle21c/x86_64/dummy-redhat-release-8.7-1.amzn2023.x86_64.rpm
wget https://github.com/luodonghua/preinstall-rpms/raw/refs/heads/main/AL2023.7-Oracle21c/x86_64/dummy-compat-openssl10-1.0.2o-1.amzn2023.x86_64.rpm


# Install Oracle Prerequisites
sudo dnf install -y ./oracle-database-preinstall-21c*.rpm ./dummy-*.rpm

# Install Oracle Database
sudo dnf install -y ./oracle-database-xe-21c*.rpm

#
# Install this RPM to avoid error: FATAL] Error while executing "/opt/oracle/product/21c/dbhomeXE/ord/im/admin/ordlib.sql"
sudo dnf install -y libxcrypt-compat

# Configure Database
#
sudo su -c "(echo 'Welcome123_'; echo 'Welcome123_';) | /etc/init.d/oracle-xe-21c configure"

# Configure AutoStart
sudo sed -i 's/\(.*\):N$/\1:Y/' /etc/oratab
sudo systemctl enable --now oracle-xe-21c

# Setup Oracle Envronment Variable
sudo su -c "echo 'export ORACLE_SID=XE' >> /home/oracle/.bash_profile"
sudo su -c "echo 'export ORACLE_BASE=/opt/oracle' >> /home/oracle/.bash_profile"
sudo su -c "echo 'export ORACLE_HOME=/opt/oracle/product/21c/dbhomeXE' >> /home/oracle/.bash_profile"
sudo su -c "echo 'export PATH=$ORACLE_HOME/bin:$PATH' >> /home/oracle/.bash_profile"
sudo su -c "echo 'export LD_LIBRARY_PATH=/lib64:$ORACLE_HOME/lib' >> /home/oracle/.bash_profile"

sudo su -c "echo 'export ORACLE_SID=XE' >> /home/ec2-user/.bash_profile"
sudo su -c "echo 'export ORACLE_BASE=/opt/oracle' >> /home/ec2-user/.bash_profile"
sudo su -c "echo 'export ORACLE_HOME=/opt/oracle/product/21c/dbhomeXE' >> /home/ec2-user/.bash_profile"
sudo su -c "echo 'export PATH=$ORACLE_HOME/bin:$PATH' >> /home/ec2-user/.bash_profile"
sudo su -c "echo 'export LD_LIBRARY_PATH=/lib64:$ORACLE_HOME/lib' >> /home/ec2-user/.bash_profile"


# DISABLE EM Expresss https://<public IP>:5500/em
. ~/.bash_profile
sqlplus SYSTEM/Welcome123_ <<EOD
EXEC DBMS_XDB.SETLISTENERLOCALACCESS(FALSE);
EXEC  DBMS_XDB_CONFIG.SETHTTPPORT(0);
EOD

echo "Oracle Service: XE (CDB), xepdb1 (PDB)"

# Enable archived log
echo "#!/usr/bin/bash" > /tmp/enable_archivelog.sh
echo "mkdir /opt/oracle/fra" >> /tmp/enable_archivelog.sh
echo "sqlplus / as sysdba <<EOD" >> /tmp/enable_archivelog.sh
echo "alter system set db_recovery_file_dest_size=10G;" >> /tmp/enable_archivelog.sh
echo "alter system set db_recovery_file_dest='/opt/oracle/fra';" >> /tmp/enable_archivelog.sh
echo "shutdown immediate" >> /tmp/enable_archivelog.sh
echo "startup mount" >> /tmp/enable_archivelog.sh
echo "alter database archivelog;" >> /tmp/enable_archivelog.sh
echo "alter database open;" >> /tmp/enable_archivelog.sh
echo "EOD" >> /tmp/enable_archivelog.s

chmod +x  /tmp/enable_archivelog.sh
sudo su - oracle -c  /tmp/enable_archivelog.sh


#!/usr/bin/bash

# Install RPM build tools
sudo yum install -y rpm-build rpmdevtools

# Set up the RPM build directory structure
rpmdev-setuptree

# Build RPM file
rpmbuild --define "_rpmdir ." -bb dummy-compat-openssl10.spec

# Copy build RPM file to current folder
# cp ./x86_64/dummy-compat-openssl10*.rpm .
#
# To Install, run below command
# sudo rpm -ivh ./x86_64/dummy-compat-openssl10*.rpm



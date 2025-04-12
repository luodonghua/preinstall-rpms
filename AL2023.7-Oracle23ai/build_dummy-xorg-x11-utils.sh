#!/usr/bin/bash

# Install RPM build tools
sudo yum install -y rpm-build rpmdevtools

# Set up the RPM build directory structure
rpmdev-setuptree

# Build RPM file
rpmbuild --define "_rpmdir ." -bb dummy-xorg-x11-utils.spec

# Copy build RPM file to current folder
# cp ./x86_64/dummy-xorg-x11-utils-7.5-39*.rpm .
#
# To Install, run below command
# sudo rpm -ivh ./x86_64/dummy-xorg-x11-utils-7.5-39*.rpm



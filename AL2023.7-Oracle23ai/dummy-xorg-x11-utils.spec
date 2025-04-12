Name:           dummy-xorg-x11-utils
Version:        7.5
Release:        39%{?dist}
Summary:        Dummy package that provides xorg-x11-utils
License:        MIT

BuildArch:      x86_64 
Provides:       xorg-x11-utils = 7.5-39
# Don't conflict with the actual utilities that obsolete xorg-x11-utils
Conflicts:      xorg-x11-utils

%description
This is a dummy package that provides the xorg-x11-utils virtual capability
without containing any files that would conflict with the individual X11
utility packages in Amazon Linux 2023.

%prep
# Nothing to do

%build
# Nothing to build

%install
# Create an empty directory structure
mkdir -p %{buildroot}

%files
# No files

%changelog
* Thu Mar 20 2025 User <user@example.com> - 7.5-39
- Initial dummy package
EOF

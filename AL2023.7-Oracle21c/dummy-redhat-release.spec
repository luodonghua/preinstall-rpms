Name:           dummy-redhat-release
Version:        8.7
Release:        1%{?dist}
Summary:        Dummy Red Hat Enterprise Linux release file
License:        MIT

BuildArch:      x86_64
Provides:       redhat-release = 8,7
#Provides:       system-release = 2023.7.20250331

%description
This package provides a dummy /etc/redhat-release file to satisfy dependencies
for packages that require it on non-RHEL systems like Amazon Linux.

%prep
# Nothing to do

%build
# Nothing to build

%install
mkdir -p %{buildroot}/etc
echo "Red Hat Enterprise Linux release 8.7 (Ootpa)" > %{buildroot}/etc/redhat-release

%files
%attr(0644,root,root) /etc/redhat-release

%changelog
* Sat Apr 12 2025 User <user@example.com> - 8.7-1
- Initial package for RHEL 8 compatibility

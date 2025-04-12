Name:           dummy-redhat-release
Version:        9.0
Release:        1%{?dist}
Summary:        Dummy Red Hat Enterprise Linux release file
License:        MIT

BuildArch:      x86_64
Provides:       redhat-release = 9.0
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
echo "Red Hat Enterprise Linux release 9.0 (Plow)" > %{buildroot}/etc/redhat-release

%files
%attr(0644,root,root) /etc/redhat-release

%changelog
* Thu Mar 20 2025 User <user@example.com> - 9.0-1
- Initial package

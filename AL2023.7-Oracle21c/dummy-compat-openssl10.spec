Name:           dummy-compat-openssl10
Version:        1.0.2o
Release:        1%{?dist}
Summary:        Dummy package for compat-openssl10
License:        MIT

BuildArch:      x86_64
Provides:       compat-openssl10 = 1:1.0.2o

%description
This package provides a dummy compat-openssl10 to satisfy dependencies.

%prep
# Nothing to do

%build
# Nothing to build

%install
# Nothing to install

%files
# No files

%changelog
* Sat Apr 12 2025 User <user@example.com> - 1.0.2o-1
- Initial package

%define name sailfish-patch-gotodate
%define version 0.2

Name: %{name}
Version: %{version}
Release: 1
Summary: Simple patch that allows you to specify date to go to in calendar
License: WTFPL
URL: http://www.chrastecky.cz

%files
%defattr(-,root,root,-)
/usr/share/*

%description
Simple patch that allows you to specify date to go to in calendar

%changelog
* Thu Mar 3 2016 Rikudou_Sennin <dominik@chrastecky.cz> - 0.2-1
- Changed to comboboxes
* Wed Mar 2 2016 Rikudou_Sennin <dominik@chrastecky.cz> - 0.1-1
- This patch has seen the light of this world for the first time

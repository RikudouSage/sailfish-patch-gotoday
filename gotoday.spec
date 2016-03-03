%define name sailfish-patch-gotodate
%define version 0.1

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
* Fri Sep 18 2015 Rikudou_Sennin <dominik@chrastecky.cz> - 1.0-1
- This patch has seen the light of this world for the first time

# CHANGELOG

## 0.2.6

* Added support for Debian 10
* **iptables::rule**: uid-owner/gid-owner support

## 0.2.5

* Added support for RHEL 8

## 0.2.4

* Updated metadata for **eyp-systemd 0.2.0**

## 0.2.3

* added SLES 12.4 support

## 0.2.2

* added SLES 12.3 support

## 0.2.1

* added Ubuntu 18.04 support

## 0.2.0

* **INCOMPATIBLE CHANGES**:
  - **iptables::rule**: renamed **interface** to **in_interface** and **inverse_interface** to **inverse_in_interface**
  - **iptables::rule**: changed default target to undef
* added **out_interface** and **inverse_out_interface**
* check the presence of ::logrotate if **manage_logrotate** is set to true
* added the ability to create chains via **iptables::chain**

## 0.1.21

* added support for interface and reject-with options to **iptables::rule**

## 0.1.20

* bugfix: service notification with firewalld class enabled

## 0.1.19

* added stateful firewall options

## 0.1.18

* bugfix: integration with eyp-firewalld using **::eyp_firewalld_status**

## 0.1.17

* added support to add rules to the persistent rules files
* added IPv6 support
* removed rspec testing

## 0.1.16

* bugfix Ubuntu 16.04 service

## 0.1.15

* added Ubuntu 16.04 support

## 0.1.14

* added include for logrotate
* fixed rspec testing

## 0.1.12

* apply logrotate config even if it is using firewalld

## 0.1.11

* fixed typo

## 0.1.10

* * logrotate configuration file using eyp-logrotate (manage_logrotate=>false to disable)

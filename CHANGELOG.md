# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v8.0.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v8.0.0) (2025-05-08)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v7.0.0...v8.0.0)

**Breaking changes:**

- Drop EOL Ubuntu 20.04 CentOS 7, 8 and RHEL 7 [\#122](https://github.com/voxpupuli/puppet-fetchcrl/pull/122) ([traylenator](https://github.com/traylenator))

**Implemented enhancements:**

- Support CentOS 10 and Ubuntu 24.04 [\#123](https://github.com/voxpupuli/puppet-fetchcrl/pull/123) ([traylenator](https://github.com/traylenator))
- Support puppetlabs-apt v10 [\#121](https://github.com/voxpupuli/puppet-fetchcrl/pull/121) ([traylenator](https://github.com/traylenator))
- GPG key update EUGridPMA-RPM v3 to v4r1 [\#120](https://github.com/voxpupuli/puppet-fetchcrl/pull/120) ([traylenator](https://github.com/traylenator))
- metadata.json: Add OpenVox [\#119](https://github.com/voxpupuli/puppet-fetchcrl/pull/119) ([jstraw](https://github.com/jstraw))

## [v7.0.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v7.0.0) (2024-02-26)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v6.0.0...v7.0.0)

**Breaking changes:**

- Drop Ubuntu 18.04 support [\#104](https://github.com/voxpupuli/puppet-fetchcrl/pull/104) ([zilchms](https://github.com/zilchms))
- Drop Debian 10 support [\#103](https://github.com/voxpupuli/puppet-fetchcrl/pull/103) ([zilchms](https://github.com/zilchms))

**Implemented enhancements:**

- Add support for Debian 12 [\#106](https://github.com/voxpupuli/puppet-fetchcrl/pull/106) ([traylenator](https://github.com/traylenator))
- Parameter hardening for private classes [\#105](https://github.com/voxpupuli/puppet-fetchcrl/pull/105) ([zilchms](https://github.com/zilchms))
- puppetlabs/apt: Allow 9.x [\#102](https://github.com/voxpupuli/puppet-fetchcrl/pull/102) ([zilchms](https://github.com/zilchms))

**Merged pull requests:**

- Fix missing docs and simplify period\_method check [\#109](https://github.com/voxpupuli/puppet-fetchcrl/pull/109) ([zilchms](https://github.com/zilchms))
- Update Readme: fix broken links, improve formating [\#108](https://github.com/voxpupuli/puppet-fetchcrl/pull/108) ([rwaffen](https://github.com/rwaffen))
- Improve English of README [\#99](https://github.com/voxpupuli/puppet-fetchcrl/pull/99) ([traylenator](https://github.com/traylenator))

## [v6.0.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v6.0.0) (2023-08-16)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v5.1.0...v6.0.0)

**Breaking changes:**

- Drop Puppet 6 support [\#91](https://github.com/voxpupuli/puppet-fetchcrl/pull/91) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add AlmaLinux/Rocky/OracleLinux support  [\#96](https://github.com/voxpupuli/puppet-fetchcrl/pull/96) ([traylenator](https://github.com/traylenator))
- Add Puppet 8 support [\#94](https://github.com/voxpupuli/puppet-fetchcrl/pull/94) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#93](https://github.com/voxpupuli/puppet-fetchcrl/pull/93) ([bastelfreak](https://github.com/bastelfreak))
- Support RHEL9, Debian11 and Ubuntu 22.04 [\#87](https://github.com/voxpupuli/puppet-fetchcrl/pull/87) ([traylenator](https://github.com/traylenator))
- New comment parameter to fetch-crl::ca type [\#86](https://github.com/voxpupuli/puppet-fetchcrl/pull/86) ([traylenator](https://github.com/traylenator))
- rubocop corrections for rubocop 1.22.3 [\#83](https://github.com/voxpupuli/puppet-fetchcrl/pull/83) ([traylenator](https://github.com/traylenator))

**Merged pull requests:**

-  RSpec/EmptyExampleGroup is no longer failing [\#85](https://github.com/voxpupuli/puppet-fetchcrl/pull/85) ([traylenator](https://github.com/traylenator))

## [v5.1.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v5.1.0) (2021-09-27)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v5.0.0...v5.1.0)

**Implemented enhancements:**

- Support hash of fetchcrl::ca as parameter [\#79](https://github.com/voxpupuli/puppet-fetchcrl/pull/79) ([traylenator](https://github.com/traylenator))

**Merged pull requests:**

- Allow stdlib 8.0.0 [\#78](https://github.com/voxpupuli/puppet-fetchcrl/pull/78) ([smortex](https://github.com/smortex))

## [v5.0.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v5.0.0) (2021-03-23)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v4.1.0...v5.0.0)

**Breaking changes:**

- Drop Puppet 5 and CentOS 6 Support [\#71](https://github.com/voxpupuli/puppet-fetchcrl/pull/71) ([traylenator](https://github.com/traylenator))

**Implemented enhancements:**

- Support Puppet 7 [\#75](https://github.com/voxpupuli/puppet-fetchcrl/pull/75) ([traylenator](https://github.com/traylenator))
- Add Ubuntu 18.04, 20.04 and Debian 10 support [\#74](https://github.com/voxpupuli/puppet-fetchcrl/pull/74) ([traylenator](https://github.com/traylenator))
- New carepo\_gpgkey parameter [\#73](https://github.com/voxpupuli/puppet-fetchcrl/pull/73) ([traylenator](https://github.com/traylenator))
- Switch from http to https for yum repository [\#72](https://github.com/voxpupuli/puppet-fetchcrl/pull/72) ([traylenator](https://github.com/traylenator))
- Add inet6glue flag configuration [\#70](https://github.com/voxpupuli/puppet-fetchcrl/pull/70) ([luisfdez](https://github.com/luisfdez))

**Merged pull requests:**

- Documentation Corrections [\#76](https://github.com/voxpupuli/puppet-fetchcrl/pull/76) ([traylenator](https://github.com/traylenator))

## [v4.1.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v4.1.0) (2020-09-14)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v4.0.0...v4.1.0)

**Implemented enhancements:**

- Enable acceptance tests for CentOS 8 [\#63](https://github.com/voxpupuli/puppet-fetchcrl/pull/63) ([traylenator](https://github.com/traylenator))
- Allow puppetlabs/stdlib 6.x [\#62](https://github.com/voxpupuli/puppet-fetchcrl/pull/62) ([dhoppe](https://github.com/dhoppe))

**Merged pull requests:**

- modulesync 3.0.0 & puppet-lint updates [\#66](https://github.com/voxpupuli/puppet-fetchcrl/pull/66) ([bastelfreak](https://github.com/bastelfreak))
- Use voxpupuli-acceptance [\#65](https://github.com/voxpupuli/puppet-fetchcrl/pull/65) ([ekohl](https://github.com/ekohl))

## [v4.0.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v4.0.0) (2019-12-05)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v3.0.0...v4.0.0)

**Breaking changes:**

- modulesync 2.7.0 and drop puppet 4 [\#52](https://github.com/voxpupuli/puppet-fetchcrl/pull/52) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Fact trustedcas to skip over invalid .pem files [\#54](https://github.com/voxpupuli/puppet-fetchcrl/pull/54) ([traylenator](https://github.com/traylenator))

**Fixed bugs:**

- Correction of typo [\#55](https://github.com/voxpupuli/puppet-fetchcrl/pull/55) ([traylenator](https://github.com/traylenator))

**Closed issues:**

- new installs only : puppet error on trustedca fact [\#51](https://github.com/voxpupuli/puppet-fetchcrl/issues/51)

**Merged pull requests:**

- Give examples headings [\#59](https://github.com/voxpupuli/puppet-fetchcrl/pull/59) ([traylenator](https://github.com/traylenator))
- Remove fictitious runatboot from docs [\#57](https://github.com/voxpupuli/puppet-fetchcrl/pull/57) ([traylenator](https://github.com/traylenator))
- Addition of RedHat 8 support [\#56](https://github.com/voxpupuli/puppet-fetchcrl/pull/56) ([traylenator](https://github.com/traylenator))

## [v3.0.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v3.0.0) (2018-12-15)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v2.1.1...v3.0.0)

**Breaking changes:**

- General code modernisation - assorted bugfixes. [\#46](https://github.com/voxpupuli/puppet-fetchcrl/pull/46) ([traylenator](https://github.com/traylenator))

**Implemented enhancements:**

- New randomcron parameter, random offset of cron [\#47](https://github.com/voxpupuli/puppet-fetchcrl/pull/47) ([traylenator](https://github.com/traylenator))

**Closed issues:**

- noerrors is not included in template [\#43](https://github.com/voxpupuli/puppet-fetchcrl/issues/43)

## [v2.1.1](https://github.com/voxpupuli/puppet-fetchcrl/tree/v2.1.1) (2018-10-14)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v2.1.0...v2.1.1)

**Merged pull requests:**

- modulesync 2.1.0 and allow puppet 6.x [\#41](https://github.com/voxpupuli/puppet-fetchcrl/pull/41) ([bastelfreak](https://github.com/bastelfreak))
- allow puppetlabs/stdlib 5.x [\#39](https://github.com/voxpupuli/puppet-fetchcrl/pull/39) ([bastelfreak](https://github.com/bastelfreak))
- Remove docker nodesets [\#35](https://github.com/voxpupuli/puppet-fetchcrl/pull/35) ([bastelfreak](https://github.com/bastelfreak))
- modulesync; Remove .el5 support, enable acceptance tests. [\#34](https://github.com/voxpupuli/puppet-fetchcrl/pull/34) ([traylenator](https://github.com/traylenator))

## [v2.1.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v2.1.0) (2018-05-15)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v2.0.1...v2.1.0)

**Merged pull requests:**

- lcg-CA obsoleted by ca-policy-egi-core [\#32](https://github.com/voxpupuli/puppet-fetchcrl/pull/32) ([traylenator](https://github.com/traylenator))

## [v2.0.1](https://github.com/voxpupuli/puppet-fetchcrl/tree/v2.0.1) (2018-03-30)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v2.0.0...v2.0.1)

**Merged pull requests:**

- bump puppet to latest supported version 4.10.0 [\#30](https://github.com/voxpupuli/puppet-fetchcrl/pull/30) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v2.0.0) (2017-10-19)

[Full Changelog](https://github.com/voxpupuli/puppet-fetchcrl/compare/v1.2.0...v2.0.0)

**Merged pull requests:**

- Fix github license detection [\#21](https://github.com/voxpupuli/puppet-fetchcrl/pull/21) ([alexjfisher](https://github.com/alexjfisher))

## [v1.2.0](https://github.com/voxpupuli/puppet-fetchcrl/tree/v1.2.0) (2017-02-11)

This is the last release with Puppet3 support!
* Use operatingsystemmajrelease fact instead of operatingsystemrelease + regex
* Fix several markdown issues
* Add missing badges
* Add minimum version_requirement for Puppet

## 2016-08-23  Release 1.1.1
- Upstream from CERNOps-fetchcrl to voxpupuli-fetchcrl.

## 2016-03-24  Release 1.1.0
- New optional parameter `cache_control_request`.

## 2015-10-09  Release 1.0.0
- Drop trustedcas fact - use trustedca instead.

## 2015-07-17  Release 0.4.0
- Hiera variables
   `fetchcrl_pkg_version`, `fetchcrl_proxy` `fetchcrl_capkgs` `fetchcrl_carepo`
   `fetchcrl_capkgs_version` are now deprecated and will print a puppet warning if
    used. They still work today but support will be removed
    at a future date.
    Use hiera binding instead, e.g fetchcrl::proxy.

## 2015-07-17 - Release 0.3.0
- New structured fact trustedca.
- The existing non structured fact trustedcas is now deprecated
  and will be removed next release.

## 2015-03-12 -  Release 0.2.2
-  Empty release for tag mistake.

## 2015-03-12 - Release 0.2.1
- Improve metadata for puppetforge.

## 2015-03-12 - Release 0.2.0
- Drop dangling sym links, fixes #2 and #3
- Add more and newer testing.

## 2013-12-11 - Release 0.1.0
- New facts certissuer and trustedcas.
- The capkgs_version and pkg_version parameters are now correctly used.

## 2012-11-21 - Second Release 0.0.2



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*

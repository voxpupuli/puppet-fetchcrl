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
    Use hiera binding instead, e.g fetchcrk::proxy.

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


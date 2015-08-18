#Class: fetchcrl
## Parameters
## *pkgversion*
# Version of fetch-crl, defaults to present.

class fetchcrl (
  $capkgs = $fetchcrl::params::capkgs,
  $carepo = $fetchcrl::params::carepo,
  $capkgs_version = $fetchcrl::params::capkgs_version,
  $pkg_version = $fetchcrl::params::pkg_version,
  $agingtolerance = $fetchcrl::params::agingtolerance,
  $nosymlinks = $fetchcrl::params::nosymlinks,
  $nowarnings  = $fetchcrl::params::nowarnings,
  $http_proxy = $fetchcrl::params::http_proxy,
  $httptimeout = $fetchcrl::params::httptimeout,
  $parallelism = $fetchcrl::params::parallelism,
  $logmode = $fetchcrl::params::logmode,
  $pkgname = $fetchcrl::params::pkgname,
  $runboot = $fetchcrl::params::runboot,
  $runcron = $fetchcrl::params::runcron,

) inherits fetchcrl::params {

  Class['fetchcrl::install'] -> Class['fetchcrl::config'] -> Class['fetchcrl::service']

  class{'fetchcrl::install':}
  class{'fetchcrl::config':}
  class{'fetchcrl::service':}

}

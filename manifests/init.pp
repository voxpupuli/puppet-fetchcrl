#Class: fetchcrl
## Parameters
## *pkgversion*
# Version of fetch-crl, defaults to present.

class fetchcrl (
  $capkgs = $fetchcrl::params::capkgs,
  $carepo = $fetchcrl::params::carepo,
  $manage_carepo = $fetchcrl::params::manage_carepo,
  $capkgs_version = $fetchcrl::params::capkgs_version,
  $pkg_version = $fetchcrl::params::pkg_version,
  $agingtolerance = $fetchcrl::params::agingtolerance,
  $nosymlinks = $fetchcrl::params::nosymlinks,
  $nowarnings  = $fetchcrl::params::nowarnings,
  $noerrors  = $fetchcrl::params::noerrors,
  $http_proxy = $fetchcrl::params::http_proxy,
  $httptimeout = $fetchcrl::params::httptimeout,
  $parallelism = $fetchcrl::params::parallelism,
  $logmode = $fetchcrl::params::logmode,
  $pkgname = $fetchcrl::params::pkgname,
  $runboot = $fetchcrl::params::runboot,
  $runcron = $fetchcrl::params::runcron,
  $cache_control_request = $fetchcrl::params::cache_control_request,

) inherits fetchcrl::params {

  Class['fetchcrl::install'] -> Class['fetchcrl::config'] -> Class['fetchcrl::service']

  class{'::fetchcrl::install':}
  class{'::fetchcrl::config':}
  class{'::fetchcrl::service':}

}

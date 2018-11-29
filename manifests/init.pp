#Class: fetchcrl
## Parameters
## *pkgversion*
# Version of fetch-crl, defaults to present.

class fetchcrl (
  $capkgs                = ['ca-policy-egi-core'],
  $carepo                = 'http://repository.egi.eu/sw/production/cas/1/current/',
  $manage_carepo         = true,
  $capkgs_version        = 'present',
  $pkg_version           = 'present',
  $agingtolerance        = 24,
  $nosymlinks            = true,
  $nowarnings            = true,
  $http_proxy            = undef,
  $httptimeout           = 30,
  $parallelism           = 4,
  $logmode               = 'syslog',
  $pkgname               = 'fetch-crl',
  $runboot               = false,
  $runcron               = true,
  $cache_control_request = undef,
) {

  Class['fetchcrl::install'] -> Class['fetchcrl::config'] -> Class['fetchcrl::service']

  class{'::fetchcrl::install':}
  class{'::fetchcrl::config':}
  class{'::fetchcrl::service':}

}

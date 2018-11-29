#Class: fetchcrl
## Parameters
## *pkgversion*
# Version of fetch-crl, defaults to present.

class fetchcrl (
  Array[String[1]] $capkgs = ['ca-policy-egi-core'],
  Stdlib::Httpurl $carepo = 'http://repository.egi.eu/sw/production/cas/1/current/',
  Boolean $manage_carepo = true,
  String $capkgs_version = 'present',
  String $pkg_version = 'present',
  Integer $agingtolerance = 24,
  Boolean $nosymlinks = true,
  Boolean $nowarnings = true,
  Optional[Stdlib::Httpurl] $http_proxy = undef,
  Integer $httptimeout = 30,
  Integer $parallelism = 4,
  Enum['direct','qualified','cache','syslog'] $logmode = 'syslog',
  String[1] $pkgname = 'fetch-crl',
  Boolean $runboot = false,
  Boolean $runcron = true,
  Optional[Integer] $cache_control_request = undef,
) {

  Class['fetchcrl::install'] -> Class['fetchcrl::config'] -> Class['fetchcrl::service']

  class{'::fetchcrl::install':}
  class{'::fetchcrl::config':}
  class{'::fetchcrl::service':}

}

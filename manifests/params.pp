#Class: fetchcrl::params
class fetchcrl::params {

  $pkgname = fetch-crl

  # Deprecate fetchcrl_pkg_version/
  $_pkg_version = hiera('fetchcrl_pkg_version',false)
  if $_pkg_version {
    warning('fetchcrl - Hiera variable fetchcrl_pkg_version is deprecated, use fetchcrl::pkg_version')
    $pkg_version = $_pkg_version
  } else {
    $pkg_version = 'present'
  }

  $runboot = false
  $runcron = true

  $agingtolerance = 24
  $nosymlinks     = true
  $nowarnings     = true
  $_http_proxy    = hiera('fetchcrl_proxy',false)
  if $_http_proxy {
    warning('fetchcrl - hiera var fetchcrl_proxy is deprecated, use fetchcrl::proxy instead')
    $http_proxy = $_http_proxy
  } else {
    $http_proxy = undef
  }
  $httptimeout    = 30
  $parallelism    = 4
  $logmode        = 'syslog'

  $_capkgs        = hiera('fetchcrl_capkgs', false)
  if $_capkgs {
    warning('fetchcrl - fetchcrl_capkgs is deprecated, use fetchcrl::capkgs instead')
    $capkgs = $_capkgs
  } else {
    $capkgs =   ['ca-policy-egi-core']
  }
  $_carepo        = hiera('fetchcrl_carepo',false)
  if $_carepo {
    warning('fetchcrl = fetchcrl_carepo is deprecated, use fetchcrl::carepo istead')
    $carepo = $_carepo
  } else {
    $carepo         = 'http://repository.egi.eu/sw/production/cas/1/current/'
  }
  $manage_carepo = true
  $_capkgs_version  =hiera('fetchcrl_capkgs_version',false)
  if $_capkgs_version {
    warning('fetchcrl - fetchcrl_capkgs_version is deprecated, use fetchcrl::capkgs_version instead')
  } else {
    $capkgs_version = 'present'
  }

  $cache_control_request = undef

}



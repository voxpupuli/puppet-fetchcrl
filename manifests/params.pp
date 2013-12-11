#Class: fetchcrl::params
class fetchcrl::params {

  if $::osfamily == 'RedHat' and $::operatingsystemrelease =~ /^5\..*/ {
    $pkgname = fetch-crl3
  } else {
    $pkgname = fetch-crl
  }
  $pkg_version = hiera('fetchcrl_pkg_version','present')

  $runboot = false
  $runcron = true

  $agingtolerance = 24
  $nosymlinks     = true
  $nowarnings     = true
  $http_proxy     = hiera('fetchcrl_proxy',undef)
  $httptimeout    = 30
  $parallelism    = 4
  $logmode        = 'syslog'

  $capkgs         = hiera('fetchcrl_capkgs',['lcg-CA'])
  $carepo         = hiera('fetchcrl_carepo','http://repository.egi.eu/sw/production/cas/1/current/')
  $capkgs_version = hiera('fetchcrl_capkgs_version','present')
}



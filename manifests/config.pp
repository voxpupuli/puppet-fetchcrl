#
#
#
class fetchcrl::config (
  $agingtolerance = $fetchcrl::params::agingtolerance,
  $nosymlinks     = $fetchcrl::params::nosymlinks,
  $nowarnings     = $fetchcrl::params::nowarnings,
  $http_proxy     = $fetchcrl::params::http_proxy,
  $httptimeout    = $fetchcrl::params::httptimeout,
  $parallelism    = $fetchcrl::params::parallelism,
  $logmode        = $fetchcrl::params::logmode,
  $pkgname        = $fetchcrl::params::pkgname
) inherits fetchcrl::params {

  file{"/etc/${pkgname}.conf":
    ensure  => present,
    content => template('fetchcrl/fetch-crl.conf.erb'),
    mode    => '0644',
    owner   => root,
    group   => root
  }

}

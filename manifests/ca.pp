#
define fetchcrl::ca(
  $anchorname     = $title,
  $nowarnings     = true,
  $noerrors       = true,
  $httptimeout    = undef,
  $agingtolerance = undef,
  $crl_url        = []
) {

  include 'fetchcrl::params'

  file{"/etc/${::fetchcrl::params::pkgname}.d/${anchorname}.conf":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('fetchcrl/fetch-crl-anchor.conf.erb')
  }
}


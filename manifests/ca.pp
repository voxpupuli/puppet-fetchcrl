#
define fetchcrl::ca(
  String[1] $anchorname = $title,
  Optional[Boolean] $nowarnings = undef,
  Optional[Boolean] $noerrors = undef,
  Optional[Integer] $httptimeout = undef,
  Optional[Integer] $agingtolerance = undef,
  Optional[Array[Stdlib::Httpurl]] $crl_url = [],
) {

  include '::fetchcrl'

  file{"/etc/${::fetchcrl::pkgname}.d/${anchorname}.conf":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('fetchcrl/fetch-crl-anchor.conf.erb'),
  }
}


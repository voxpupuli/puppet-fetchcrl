#
define fetchcrl::ca(
  String[1] $anchorname = $title,
  Boolean $nowarnings                       = false,
  Boolean $noerrors                         = false,
  Optional[Integer] $httptimeout            = undef,
  Optional[Integer] $agingtolerance         = undef,
  Optional[Array[Stdlib::Httpurl]] $crl_url = [],
) {

  include '::fetchcrl'

  file{"/etc/${::fetchcrl::pkgname}.d/${anchorname}.conf":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => epp('fetchcrl/fetch-crl-anchor.conf.epp',{
      'anchorname'     => $anchorname,
      'agingtolerance' => $agingtolerance,
      'nowarnings'     => $nowarnings,
      'noerrors'       => $noerrors,
      'httptimeout'    => $httptimeout,
      'crl_url'        => $crl_url,
      }),
  }
}


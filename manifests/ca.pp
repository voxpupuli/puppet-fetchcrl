# @summary
#  Creates per CA configuration files.
#
# @example
#  fetchcrl::ca{'EDG-Tutorial-CA':
#    agingtolerance => 168
#  }
#
# @param name
#  The name of the CA to manage a configuration for.
#
# @param anchorname
#  The name of the CA to manage a configuration for.
#
# @param nowarnings
#  Should warnings be supressed for this CA.
#
# @param noerrors
#  Should errors be supressed for this CA.
#
# @param httptimeout
#  The timeout for this CA.
#
# @param agingtolerance
#  The delay if failures before it is considered an error.
#
# @param crl_url
#  A list of URLs to download CAs from
#
define fetchcrl::ca(
  String[1] $anchorname             = $title,
  Boolean $nowarnings               = false,
  Boolean $noerrors                 = false,
  Optional[Integer] $httptimeout    = undef,
  Optional[Integer] $agingtolerance = undef,
  Array[Stdlib::Httpurl] $crl_url   = [],
) {

  include 'fetchcrl'

  file{"/etc/${fetchcrl::pkgname}.d/${anchorname}.conf":
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


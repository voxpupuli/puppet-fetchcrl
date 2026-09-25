# @summary
#  Creates per CA configuration files.
#
# @example Simple Example
#  fetchcrl::ca{'EDG-Tutorial-CA':
#    agingtolerance => 168,
#    comment        => 'Increased as unreliable',
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
# @param nohttp_proxy
#  Disable the http_proxy for this CA
#
# @param nohttps_proxy
#  Disable the https_proxy for this CA
#
# @param noverify_nextupdate
#  Set noverify_nextupdate for this CA
#
# @param noverify_lastupdate
#  Set noverify_lastupdate for this CA
#
# @param httptimeout
#  The timeout for this CA.
#
# @param agingtolerance
#  The delay if failures before it is considered an error.
#
# @param comment
#  Add a comment to the particular CA configuration
#
# @param crl_url
#  A list of URLs to download CAs from
#
define fetchcrl::ca (
  String[1] $anchorname             = $title,
  Boolean $nowarnings               = false,
  Boolean $noerrors                 = false,
  Boolean $nohttp_proxy             = false,
  Boolean $nohttps_proxy            = false,
  Boolean $noverify_nextupdate      = false,
  Boolean $noverify_lastupdate      = false,
  Optional[Integer] $httptimeout    = undef,
  Optional[Integer] $agingtolerance = undef,
  Optional[String[1]] $comment      = undef,
  Array[Stdlib::Httpurl] $crl_url   = [],
) {
  include 'fetchcrl'

  file { "/etc/${fetchcrl::pkgname}.d/${anchorname}.conf":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => epp('fetchcrl/fetch-crl-anchor.conf.epp', {
      'anchorname'          => $anchorname,
      'agingtolerance'      => $agingtolerance,
      'nowarnings'          => $nowarnings,
      'noerrors'            => $noerrors,
      'noverify_nextupdate' => $noverify_nextupdate,
      'noverify_lastupdate' => $noverify_lastupdate,
      'nohttp_proxy'        => $nohttp_proxy,
      'nohttps_proxy'       => $nohttps_proxy,
      'httptimeout'         => $httptimeout,
      'crl_url'             => $crl_url,
      'comment'             => $comment,
    }),
  }
}

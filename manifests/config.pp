# @summary  Configures fetch-crl
#
# @api private
#
class fetchcrl::config (
  Integer $agingtolerance                              = $fetchcrl::agingtolerance,
  Boolean $nosymlinks                                  = $fetchcrl::nosymlinks,
  Boolean $inet6glue                                   = $fetchcrl::inet6glue,
  Boolean $nowarnings                                  = $fetchcrl::nowarnings,
  Boolean $noerrors                                    = $fetchcrl::noerrors,
  Optional[Stdlib::Httpurl] $http_proxy                = $fetchcrl::http_proxy,
  Optional[Stdlib::Httpurl] $https_proxy               = $fetchcrl::https_proxy,
  Integer $httptimeout                                 = $fetchcrl::httptimeout,
  Integer $parallelism                                 = $fetchcrl::parallelism,
  Boolean $randomcron                                  = $fetchcrl::randomcron,
  Boolean $selective_http_proxy                        = $fetchcrl::selective_http_proxy,
  Boolean $noverify_nextupdate                         = $fetchcrl::noverify_nextupdate,
  Boolean $noverify_lastupdate                         = $fetchcrl::noverify_lastupdate,
  Enum['direct','qualified','cache','syslog'] $logmode = $fetchcrl::logmode,
  String[1] $pkgname                                   = $fetchcrl::pkgname,
  Optional[Integer] $cache_control_request             = $fetchcrl::cache_control_request,
  Optional[Enum['dual','single']] $opensslmode         = $fetchcrl::opensslmode,
  Optional[Hash] $cas                                  = $fetchcrl::cas,
) {
  assert_private()

  if $facts['os']['family'] == 'RedHat' and versioncmp($facts['os']['release']['major'],'9') >= 0 or
  $facts['os']['name'] == 'Debian' and versioncmp($facts['os']['release']['major'],'12') >= 0 or
  $facts['os']['name'] == 'Ubuntu' and versioncmp($facts['os']['release']['major'],'24.04') >= 0 {
    $_inet6glue = false
  } else {
    $_inet6glue = $inet6glue
  }

  file { "/etc/${pkgname}.conf":
    ensure  => file,
    content => epp('fetchcrl/fetch-crl.conf.epp', {
      'agingtolerance'        => $agingtolerance,
      'nosymlinks'            => $nosymlinks,
      'inet6glue'             => $_inet6glue,
      'nowarnings'            => $nowarnings,
      'noerrors'              => $noerrors,
      'http_proxy'            => $http_proxy,
      'https_proxy'           => $https_proxy,
      'httptimeout'           => $httptimeout,
      'parallelism'           => $parallelism,
      'logmode'               => $logmode,
      'cache_control_request' => $cache_control_request,
      'opensslmode'           => $opensslmode,
      'selective_http_proxy'  => $selective_http_proxy,
      'noverify_nextupdate'   => $noverify_nextupdate,
      'noverify_lastupdate'   => $noverify_lastupdate,
    }),
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  # Keep the directory based configuration empty.
  file { "/etc/${pkgname}.d":
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0755',
    purge   => true,
    force   => true,
    recurse => true,
  }

  if $cas {
    $cas.each |$_name, $_config| {
      fetchcrl::ca { $_name:
        * => $_config,
      }
    }
  }

  # Debian, Ubuntu package has the timer add but cron jobs are still present.
  # https://bugs.launchpad.net/ubuntu/+source/fetch-crl/+bug/1920742
  if $facts['os']['family'] == 'Debian' {
    file { '/etc/cron.d/fetch-crl':
      ensure => absent,
    }
  }
}

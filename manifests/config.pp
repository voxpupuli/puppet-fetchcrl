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
  Integer $httptimeout                                 = $fetchcrl::httptimeout,
  Integer $parallelism                                 = $fetchcrl::parallelism,
  Boolean $randomcron                                  = $fetchcrl::randomcron,
  Enum['direct','qualified','cache','syslog'] $logmode = $fetchcrl::logmode,
  String[1] $pkgname                                   = $fetchcrl::pkgname,
  Optional[Integer] $cache_control_request             = $fetchcrl::cache_control_request,
  Optional[Hash] $cas                                  = $fetchcrl::cas,
) {
  assert_private()

  if $facts['os']['family'] == 'RedHat' and versioncmp($facts['os']['release']['major'],'9') >= 0 or
  $facts['os']['name'] == 'Debian' and versioncmp($facts['os']['release']['major'],'12') >= 0 {
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
        'httptimeout'           => $httptimeout,
        'parallelism'           => $parallelism,
        'logmode'               => $logmode,
        'cache_control_request' => $cache_control_request,
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

  # Set 6 hour interval cron to have a random offset.
  if $fetchcrl::periodic_method == 'cron' and $randomcron {
    $_hour = "${fqdn_rand(6,'fetchcrl')}-23/6"
    $_minute  = fqdn_rand(60,'fetchcrl')
    augeas { 'randomise_cron':
      incl    => '/etc/cron.d/fetch-crl',
      lens    => 'Cron.lns',
      context => '/files/etc/cron.d/fetch-crl/entry/time',
      changes => [
        "set minute ${_minute}",
        "set hour ${_hour}",
      ],
    }
  }

  if $cas {
    $cas.each |$_name, $_config| {
      fetchcrl::ca { $_name:
        * => $_config,
      }
    }
  }

  #Ubuntu 20.04 package has the timer add but cron jobs are still present.
  # https://bugs.launchpad.net/ubuntu/+source/fetch-crl/+bug/1920742
  if $fetchcrl::periodic_method == 'timer' and $facts['os']['family'] == 'Debian' {
    file { '/etc/cron.d/fetch-crl':
      ensure => absent,
    }
  }
}

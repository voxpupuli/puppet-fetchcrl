#  Configures fetch-crl
#
# @api private
#
class fetchcrl::config (
  $agingtolerance        = $fetchcrl::agingtolerance,
  $nosymlinks            = $fetchcrl::nosymlinks,
  $nowarnings            = $fetchcrl::nowarnings,
  $noerrors              = $fetchcrl::noerrors,
  $http_proxy            = $fetchcrl::http_proxy,
  $httptimeout           = $fetchcrl::httptimeout,
  $parallelism           = $fetchcrl::parallelism,
  $randomcron            = $fetchcrl::randomcron,
  $logmode               = $fetchcrl::logmode,
  $pkgname               = $fetchcrl::pkgname,
  $cache_control_request = $fetchcrl::cache_control_request,
) {
  assert_private()

  file { "/etc/${pkgname}.conf":
    ensure  => file,
    content => epp('fetchcrl/fetch-crl.conf.epp',{
        'agingtolerance'        => $agingtolerance,
        'nosymlinks'            => $nosymlinks,
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

  #Ubuntu 20.04 package has the timer add but cron jobs are still present.
  # https://bugs.launchpad.net/ubuntu/+source/fetch-crl/+bug/1920742
  if $fetchcrl::periodic_method == 'timer' and $facts['os']['family'] == 'Debian' {
    file { '/etc/cron.d/fetch-crl':
      ensure => absent,
    }
  }
}

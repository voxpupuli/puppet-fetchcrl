# fetchcrl
#
# @summary
#  Main class, installs fetch-crl and configured it.
#  https://wiki.nikhef.nl/grid/FetchCRL3
#
# @example Simple Example
#  class{'fetchcrl':
#    http_proxy            => 'http:://squid.example.org:8000',
#    carepo                => 'http://yum.example.org/yumrepo',
#    cache_control_request => '3600',
#  }
#
# @param capkgs
#  CA policy packages to install.
#
# @param carepo
#  Repository URL of CA packages.
#
# @param manage_carepo
#  Should package repository be configured.
#
# @param capkgs_version
#  Version of CA packages.
#
# @param pkg_version
#  Version of fetch-crl package.
#
# @param agingtolerance
#  Number of hours delay time before errors are generated in case downloads consistently fail.
#
# @param nosymlinks
#  do not create serial number symlinks.
#
# @param noerrors
#  do not produce errors.
#
# @param nowarnings
#  do not produce warnings.
#
# @param http_proxy
#  List of http proxy URLs.
#
# @param httptimeout
#  Time out for http.
#
# @param parallelism
#  Number of fetchs to run concurrently.
#
# @param logmode
#  Specify how logging is done.
#
# @param pkgname
#  Name of fetch-crl package.
#
# @param runcron
#  Should fetch-crl be run as a cron job.
#
# @param runboot
#  Should fetch-crl be run at boot time.
#  This parameter is only significant for fetch-crl packages
#  that do not use a cron based package and not a systemd timer.
#
# @param randomcron
#  Should the every 6 hour cron be configured with a random offset.
#  With osfamily RedHat 8 or newer the randomcron parameter is ignored.
#  The systemd timer for fetch-crl is already very random.
#
# @param cache_control_request
#  sends a cache-control max-age hint in seconds towards the server in the HTTP request.
#
class fetchcrl (
  Array[String[1]] $capkgs                 = ['ca-policy-egi-core'],
  Stdlib::Httpurl $carepo                  = 'http://repository.egi.eu/sw/production/cas/1/current/',
  Boolean $manage_carepo                   = true,
  String $capkgs_version                   = 'present',
  String $pkg_version                      = 'present',
  Integer $agingtolerance                  = 24,
  Boolean $nosymlinks                      = true,
  Boolean $nowarnings                      = true,
  Boolean $noerrors                        = false,
  Boolean $randomcron                      = true,
  Optional[Stdlib::Httpurl] $http_proxy    = undef,
  Integer $httptimeout                     = 30,
  Integer $parallelism                     = 4,
  Enum['direct','qualified', 'cache','syslog'] $logmode = 'syslog',
  String[1] $pkgname                       = 'fetch-crl',
  Boolean $runboot                         = false,
  Boolean $runcron                         = true,
  Optional[Integer] $cache_control_request = undef,
) {
  # Is the package cron or systemd.timer based?
  $periodic_method = $facts['os']['release']['major'] ? {
    '7' => 'cron',
    default => 'timer',
  }

  contain 'fetchcrl::install'
  contain 'fetchcrl::config'
  contain 'fetchcrl::service'

  Class['fetchcrl::install']
  -> Class['fetchcrl::config']
  ~> Class['fetchcrl::service']
}

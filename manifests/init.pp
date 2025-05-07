# fetchcrl
#
# @summary
#  Main class, installs fetch-crl and configures it.
#
# @see https://wiki.nikhef.nl/grid/FetchCRL3 FetchCRL3
#
#
# @example Simple Example
#  class{'fetchcrl':
#    http_proxy            => 'http:://squid.example.org:8000',
#    carepo                => 'http://yum.example.org/yumrepo',
#    cache_control_request => '3600',
#  }
#
# @example A hash of particular CA configurations
#  class{'fetchcrl':
#    cas => {
#      'EDG-Tutorial-CA' => {
#        'agingtolerance' => 168,
#       }
#       'MD-Grid-CA-T'   => {
#        'noerrors'       => true,
#       }
#      }
#    }
#  }
#
# @param capkgs
#  CA policy packages to install.
#
# @param carepo
#  Repository URL of CA packages.
#
# @param carepo_gpgkey
#  Repository URL of GPG key for CA packages.
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
#  Do not create serial number symlinks.
#
# @param inet6glue
#  use Net::INET6Glue , parameter is ignored on RedHat 9 or Debian 12 and newer.
#
# @param noerrors
#  Do not produce errors.
#
# @param nowarnings
#  Do not produce warnings.
#
# @param http_proxy
#  http proxy URLs. For example http://foobar.example.org:3218/
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
#  Should fetch-crl be run periodically either as a cron job or timer as appropriate.
#
# @param randomcron
#  Should the every 6 hour cron be configured with a random offset.
#  With osfamily RedHat 8 or newer the randomcron parameter is ignored.
#  The systemd timer for fetch-crl is already very random.
#
# @param cache_control_request
#  Sends a cache-control max-age hint in seconds towards the server in the HTTP request.
#
# @param cas
#  A hash of `fetchcrl::ca` defined types to load.
#
class fetchcrl (
  Array[String[1]] $capkgs                 = ['ca-policy-egi-core'],
  Stdlib::Httpurl $carepo                  = 'https://repository.egi.eu/sw/production/cas/1/current/',
  Stdlib::Httpurl $carepo_gpgkey           = 'https://repository.egi.eu/sw/production/cas/1/current/GPG-KEY-EUGridPMA-RPM-4R1',
  Boolean $manage_carepo                   = true,
  String $capkgs_version                   = 'present',
  String $pkg_version                      = 'present',
  Integer $agingtolerance                  = 24,
  Boolean $nosymlinks                      = true,
  Boolean $inet6glue                       = false,
  Boolean $nowarnings                      = true,
  Boolean $noerrors                        = false,
  Boolean $randomcron                      = true,
  Optional[Stdlib::Httpurl] $http_proxy    = undef,
  Integer $httptimeout                     = 30,
  Integer $parallelism                     = 4,
  Enum['direct','qualified', 'cache','syslog'] $logmode = 'syslog',
  String[1] $pkgname                       = 'fetch-crl',
  Boolean $runcron                         = true,
  Optional[Integer] $cache_control_request = undef,
  Optional[Hash] $cas                      = undef,
) {
  contain 'fetchcrl::install'
  contain 'fetchcrl::config'
  contain 'fetchcrl::service'

  Class['fetchcrl::install']
  -> Class['fetchcrl::config']
  ~> Class['fetchcrl::service']
}

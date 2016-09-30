#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class fetchcrl::params
#
# This class is called from fetchcrl
# It sets platform specific defaults
#
class fetchcrl::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'fetchcrl'
      $service_name = 'fetchcrl'
    }
    'RedHat', 'Amazon': {
      case $::operatingsystemmajrelease {
        '6', '7': {
          $package_name = 'fetchcrl'
          $service_name = 'fetchcrl'
        }
        default: {
          fail("operatingsystemmajrelease `${::operatingsystemmajrelease}` not supported")
        }
      }
    }
    default: {
      fail("osfamily `${::osfamily}` not supported")
    }
  }
}

# vim: ft=puppet

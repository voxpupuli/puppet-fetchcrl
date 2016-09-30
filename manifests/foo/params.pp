#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class fetchcrl::foo::params
#
# This class is called from fetchcrl::foo
# It sets platform specific defaults
#
class fetchcrl::foo::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'fetchcrl-foo'
      $service_name = 'fetchcrl-foo'
    }
    'RedHat', 'Amazon': {
      case $::operatingsystemmajrelease {
        '6', '7': {
          $package_name = 'fetchcrl-foo'
          $service_name = 'fetchcrl-foo'
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

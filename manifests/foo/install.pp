#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class fetchcrl::foo::install
#
# This class is called from fetchcrl::foo
# It should provide its package resources
#
class fetchcrl::foo::install {
  package { $fetchcrl::foo::package_name:
    ensure => present,
  }
}
# vim: ft=puppet

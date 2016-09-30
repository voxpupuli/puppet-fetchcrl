#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class fetchcrl::install
#
# This class is called from fetchcrl
# It ensures Package resources are present
#
class fetchcrl::install {
  package { $fetchcrl::package_name:
    ensure => present,
  }
}
# vim: ft=puppet

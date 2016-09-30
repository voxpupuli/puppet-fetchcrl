#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class fetchcrl::config
#
# This class is called from fetchcrl
# It should include common resource classes
#  e.g. configuration Files
#
class fetchcrl::config {
  file { "/etc/fetchcrl.conf":
    ensure  => present,
    content => template('fetchcrl/conf.erb'),
  }
}
# vim: ft=puppet

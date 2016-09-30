#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class fetchcrl::foo::config
#
# This class is called from fetchcrl::foo
# It should provide its configuration resources
#
class fetchcrl::foo::config {
  file { '/etc/fetchcrl':
    ensure => directory
  } ->
  file { '/etc/fetchcrl/foo.conf':
    ensure  => present,
    content => template('fetchcrl/foo.conf.erb')
  }
}
# vim: ft=puppet

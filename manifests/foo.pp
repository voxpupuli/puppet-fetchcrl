#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class fetchcrl::foo
# This class implements functionality 'foo'
# In this boilerplate the class includes 3 subclasses respectively responsible
# for providing Package, configuration and Service resources
#
class fetchcrl::foo (
  $package_name = $fetchcrl::foo::params::package_name,
  $service_name = $fetchcrl::foo::params::service_name,
) inherits fetchcrl::foo::params {

  # validate parameters here

  class { 'fetchcrl::foo::install': } ->
  class { 'fetchcrl::foo::config': } ~>
  class { 'fetchcrl::foo::service': } ->
  Class['fetchcrl::foo']
}
# vim: ft=puppet

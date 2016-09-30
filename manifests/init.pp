#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class: fetchcrl
#
# Full description of class fetchcrl here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class fetchcrl (
  $package_name = $fetchcrl::params::package_name,
  $service_name = $fetchcrl::params::service_name,
) inherits fetchcrl::params {

  # validate parameters here

  class { 'fetchcrl::install': } ->
  class { 'fetchcrl::config': } ~>
  class { 'fetchcrl::service': } ->
  Class['fetchcrl']
}
# vim: ft=puppet

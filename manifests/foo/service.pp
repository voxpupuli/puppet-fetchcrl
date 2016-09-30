#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class fetchcrl::foo::service
#
# This class is called from fetchcrl::foo
# It ensures the foo service is running
#
class fetchcrl::foo::service {
  service { $fetchcrl::foo::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
# vim: ft=puppet

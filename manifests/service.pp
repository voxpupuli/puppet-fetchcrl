# @summary
#  Controls fetch-crl cron or timer.
#
# @api private
#
class fetchcrl::service (
  String[1] $pkgname = $fetchcrl::pkgname,
  Boolean $runcron   = $fetchcrl::runcron,
) {
  assert_private()

  service { "${pkgname}.timer":
    ensure => $runcron,
    enable => $runcron,
  }
}

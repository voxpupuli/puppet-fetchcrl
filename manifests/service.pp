# @summary
#  Controls fetch-crl cron and startup
#
# @api private
#
class fetchcrl::service (
  $pkgname = $fetchcrl::pkgname,
  $runboot = $fetchcrl::runboot,
  $runcron = $fetchcrl::runcron,
) {

  assert_private()

  case $fetchcrl::periodic_method {
    'cron': {
      service { "${pkgname}-boot":
        ensure     => $runboot,
        enable     => $runboot,
        hasstatus  => true,
        hasrestart => true,
      }
      service { "${pkgname}-cron":
        ensure     => $runcron,
        enable     => $runcron,
        hasstatus  => true,
        hasrestart => true,
      }
    }
    'timer': {
      service{"${pkgname}.timer":
        ensure => $runcron,
        enable => $runcron,
      }
    }
    default: { fail('periodic_method not cron or timer?') }
  }
}

#Class: fetchcrl::service
class fetchcrl::service (
  $pkgname = $fetchcrl::pkgname,
  $runboot = $fetchcrl::runboot,
  $runcron = $fetchcrl::runcron,
) inherits fetchcrl {

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
    require    => Class['fetchcrl::install'];
  }
}

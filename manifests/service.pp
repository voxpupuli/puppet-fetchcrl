class fetchcrl::service (
   $pkgname = $fetchcrl::params::pkgname,
   $runboot = $fetchcrl::params::runboot,
   $runcron = $fetchcrl::params::runcron,
) inherits fetchcrl::params {


  service { "${pkgname}-boot":
             ensure => $runboot, 
             enable => $runboot,
             hasstatus => true,
             hasrestart => true,
  }
  service { "${pkgname}-cron":
             ensure => $runcron,
             enable => $runcron,
             hasstatus => true,
             hasrestart => true,
             require => Class["fetchcrl::install"];
  }


}
  

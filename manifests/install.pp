#
#
#
class fetchcrl::install (
    $pkgname   = $fetchcrl::params::pkgname,
    $capkgs    = $fetchcrl::params::capkgs,
    $carepo    = $fetchcrl::params::carepo,
    $cagpgkey  = $fetchcrl::params::cagpgkey
) inherits fetchcrl::params {

     # The fetch-crl or fetch-crl3 package.
     package{$pkgname:
        ensure => present
     }

     # The CA meta package.
     package{$capkgs:
        ensure  => latest,
        require => Yumrepo['carepo']
     }
     osrepos::ai121yumrepo{'carepo':
        descr    => 'IGTF CA Repository',
        enabled  => 1,
        baseurl  => $carepo,
        gpgcheck => 1,
        gpgkey   => $cagpgkey,
     }




}

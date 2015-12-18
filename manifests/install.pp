#Class fetchcrl::install
class fetchcrl::install (
  $pkgname   = $fetchcrl::pkgname,
  $capkgs    = $fetchcrl::capkgs,
  $carepo    = $fetchcrl::carepo,
  $capkgs_version = $fetchcrl::capkgs_version,
  $pkg_version = $fetchcrl::pkg_version
) inherits fetchcrl {

  # The fetch-crl or fetch-crl3 package.
  package{$pkgname:
    ensure => $pkg_version,
  }

  # The CA meta package.
  package{$capkgs:
    ensure  => $capkgs_version,
    require => Yumrepo['carepo'],
  }
  yumrepo{'carepo':
    descr    => 'IGTF CA Repository',
    enabled  => 1,
    baseurl  => $carepo,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/GPG-KEY-EUGridPMA-RPM-3',
    require  => File['/etc/pki/rpm-gpg/GPG-KEY-EUGridPMA-RPM-3'],
  }

  file{'/etc/pki/rpm-gpg/GPG-KEY-EUGridPMA-RPM-3':
    ensure  => file,
    source  => 'puppet:///modules/fetchcrl/GPG-KEY-EUGridPMA-RPM-3',
    replace => false,
    owner   => root,
    group   => root,
    mode    => '0644',
  }
}

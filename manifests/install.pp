# @summary
#  Installs fetch-crl
#
# @api private
#
class fetchcrl::install (
  $pkgname        = $fetchcrl::pkgname,
  $capkgs         = $fetchcrl::capkgs,
  $carepo         = $fetchcrl::carepo,
  $carepo_gpgkey  = $fetchcrl::carepo_gpgkey,
  $manage_carepo  = $fetchcrl::manage_carepo,
  $capkgs_version = $fetchcrl::capkgs_version,
  $pkg_version    = $fetchcrl::pkg_version
) {
  assert_private()

  # The fetch-crl package.
  package { $pkgname:
    ensure => $pkg_version,
  }

  if $manage_carepo {
    yumrepo { 'carepo':
      descr    => 'IGTF CA Repository',
      enabled  => 1,
      baseurl  => $carepo,
      gpgcheck => 1,
      gpgkey   => $carepo_gpgkey,
    }

    $capkgs_require = Yumrepo['carepo']
  } else {
    $capkgs_require = undef
  }
  # The CA meta package.
  package { $capkgs:
    ensure  => $capkgs_version,
    require => $capkgs_require,
  }
}

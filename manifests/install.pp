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
    case $facts['os']['family'] {
      'RedHat': {
        yumrepo { 'carepo':
          descr    => 'IGTF CA Repository',
          enabled  => 1,
          baseurl  => $carepo,
          gpgcheck => 1,
          gpgkey   => $carepo_gpgkey,
        }
        $capkgs_require = Yumrepo['carepo']
      }
      'Debian': {
        apt::source { 'carepo':
          ensure        => 'present',
          comment       => 'IGTF CA Repository',
          location      => $carepo,
          key           => {
            ensure => refreshed,
            id     => 'D12E922822BE64D50146188BC32D99C83CDBBC71',
            source => $carepo_gpgkey,
          },
          release       => 'egi-igtf',
          repos         => 'core',
          notify_update => true,
        }
        $capkgs_require = Apt::Source['carepo']
      }
      default: {
        fail('Yum or Apt repositories can be configured on family Debian or RedHat only')
      }
    }
  } else {
    $capkgs_require = undef
  }
  # The CA meta package.
  package { $capkgs:
    ensure  => $capkgs_version,
    require => $capkgs_require,
  }
}

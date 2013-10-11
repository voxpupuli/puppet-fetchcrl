#Class: fetchcrl
class fetchcrl () inherits fetchcrl::params {

  Class['fetchcrl::install'] -> Class['fetchcrl::config'] -> Class['fetchcrl::service']

  class{'fetchcrl::install':}
  class{'fetchcrl::config':}
  class{'fetchcrl::service':}

}

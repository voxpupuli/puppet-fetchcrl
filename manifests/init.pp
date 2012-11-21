#== Class: fetchcrl
#
#Installs a fetch-crl and CA packages from IGTF.
#
#=== Parameters
#
#None
#
#=== Examples
#
#class {'fetchcrl':}
#
#
class fetchcrl () inherits fetchcrl::params {


     Class['fetchcrl::install'] -> Class['fetchcrl::config'] -> Class['fetchcrl::service']

     class{'fetchcrl::install':}
     class{'fetchcrl::config':}
     class{'fetchcrl::service':}


}

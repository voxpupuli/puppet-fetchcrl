## puppet-fetchcrl puppet module

[![Puppet Forge](http://img.shields.io/puppetforge/v/puppet/fetchcrl.svg)](https://forge.puppetlabs.com/puppet/fetchcrl)
[![Build Status](https://travis-ci.org/voxpupuli/puppet-fetchcrl.svg?branch=master)](https://travis-ci.org/voxpupuli/puppet-fetchcrl)

This is the fetchcrl module it configures fetch-crl version 3 where
ever it can.

[Fetchcrl ](http://wiki.nikhef.nl/grid/FetchCRL3) utility will retrieve certificate revocation lists (CRLs) for 
a set of installed trust anchors, based on crl_url files or IGTF-style info files.

This module obsoletes [CernOps-fetchcrl-1.1.0](https://forge.puppet.com/CERNOps/fetchcrl)

### Examples

```puppet
class{'fetchcrl':
  http_proxy            => 'http:://squid.example.org:8000',
  carepo                => 'http://yum.example.org/yumrepo',
  cache_control_request => '3600',
}

fetchcrl::ca{'EDG-Tutorial-CA':
 agingtolerance => 168
}
```

### Facts
Two custom facts are included.

*certissuer* returns the issuer of a grid certificate located at /etc/grid-security/hostcert.pem if it exists.
*trustedca*  returns an array of all the certificate authoriry subjects located at /etc/grid-security/*.pem

### License
Apache-2.0

### Copyright
Steve Traylen, steve.traylen@cern.ch>, CERN, 2016.

### Contact
Steve Traylen <steve.traylen@cern.ch>

## Support
Please log tickets and issues at http://github.ch/voxpupuli/puppet-fetchcrl

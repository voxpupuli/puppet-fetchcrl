## cernops-fetchcrl puppet module

[![Build Status](https://travis-ci.org/cernops/puppet-fetchcrl.svg?branch=master)](https://travis-ci.org/cernops/puppet-fetchcrl)

This is the fetchcrl module it configures fetch-crl version 3 where
ever it can.

### Examples

    class{'fetchcrl':}

    fetchcrl::ca{'EDG-Tutorial-CA':
         agingtolerance => 168
    }

### Facts
Two custom facts are included.

*certissuer* returns the issuer of a grid certificate located at /etc/grid-security/hostcert.pem if it exists.
*trustedcas* returns a list of all the certificate authoriry subjects located at /etc/grid-security/*.pem

### License
ASL 2.0

### Contact
Steve Traylen <steve.traylen@cern.ch>

## Support
Please log tickets and issues at our [cernops site](http://github.ch/cernops)

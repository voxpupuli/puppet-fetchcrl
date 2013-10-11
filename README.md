## cernops-fetchcrl puppet module

This is the fetchcrl module it configures fetch-crl version 3 where
ever it can.

### Examples

    class{'fetchcrl':}

    fetchcrl::ca{'EDG-Tutorial-CA':
         agingtolerance => 168
    }

### License
ASL 2.0

### Contact
Steve Traylen <steve.traylen@cern.ch>

## Support
Please log tickets and issues at our [cernops site](http://github.ch/cernops)

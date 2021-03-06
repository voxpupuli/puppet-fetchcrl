# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

#### Public Classes

* [`fetchcrl`](#fetchcrl)

#### Private Classes

* `fetchcrl::config`: Configures fetch-crl
* `fetchcrl::install`: Installs fetch-crl
* `fetchcrl::service`: Controls fetch-crl cron or timer.

### Defined types

* [`fetchcrl::ca`](#fetchcrlca): Creates per CA configuration files.

## Classes

### <a name="fetchcrl"></a>`fetchcrl`

The fetchcrl class.

#### Parameters

The following parameters are available in the `fetchcrl` class:

* [`manage_carepo`](#manage_carepo)
* [`capkgs_version`](#capkgs_version)
* [`pkg_version`](#pkg_version)
* [`agingtolerance`](#agingtolerance)
* [`nosymlinks`](#nosymlinks)
* [`inet6glue`](#inet6glue)
* [`noerrors`](#noerrors)
* [`nowarnings`](#nowarnings)
* [`http_proxy`](#http_proxy)
* [`httptimeout`](#httptimeout)
* [`parallelism`](#parallelism)
* [`logmode`](#logmode)
* [`pkgname`](#pkgname)
* [`runcron`](#runcron)
* [`runboot`](#runboot)
* [`randomcron`](#randomcron)
* [`cache_control_request`](#cache_control_request)
* [`capkgs`](#capkgs)
* [`carepo`](#carepo)
* [`carepo_gpgkey`](#carepo_gpgkey)

##### <a name="manage_carepo"></a>`manage_carepo`

Data type: `Boolean`

Should package repository be configured.

Default value: ``true``

##### <a name="capkgs_version"></a>`capkgs_version`

Data type: `String`

Version of CA packages.

Default value: `'present'`

##### <a name="pkg_version"></a>`pkg_version`

Data type: `String`

Version of fetch-crl package.

Default value: `'present'`

##### <a name="agingtolerance"></a>`agingtolerance`

Data type: `Integer`

Number of hours delay time before errors are generated in case downloads consistently fail.

Default value: `24`

##### <a name="nosymlinks"></a>`nosymlinks`

Data type: `Boolean`

Do not create serial number symlinks.

Default value: ``true``

##### <a name="inet6glue"></a>`inet6glue`

Data type: `Boolean`

use Net::INET6Glue

Default value: ``false``

##### <a name="noerrors"></a>`noerrors`

Data type: `Boolean`

Do not produce errors.

Default value: ``false``

##### <a name="nowarnings"></a>`nowarnings`

Data type: `Boolean`

Do not produce warnings.

Default value: ``true``

##### <a name="http_proxy"></a>`http_proxy`

Data type: `Optional[Stdlib::Httpurl]`

http proxy URLs. For example http://foobar.example.org:3218/

Default value: ``undef``

##### <a name="httptimeout"></a>`httptimeout`

Data type: `Integer`

Time out for http.

Default value: `30`

##### <a name="parallelism"></a>`parallelism`

Data type: `Integer`

Number of fetchs to run concurrently.

Default value: `4`

##### <a name="logmode"></a>`logmode`

Data type: `Enum['direct','qualified', 'cache','syslog']`

Specify how logging is done.

Default value: `'syslog'`

##### <a name="pkgname"></a>`pkgname`

Data type: `String[1]`

Name of fetch-crl package.

Default value: `'fetch-crl'`

##### <a name="runcron"></a>`runcron`

Data type: `Boolean`

Should fetch-crl be run periodically either as a cron job or timer as appropriate.

Default value: ``true``

##### <a name="runboot"></a>`runboot`

Data type: `Boolean`

Should fetch-crl be run at boot time.
This parameter is only significant for fetch-crl packages
that use a cron based package and not a systemd timer.

Default value: ``false``

##### <a name="randomcron"></a>`randomcron`

Data type: `Boolean`

Should the every 6 hour cron be configured with a random offset.
With osfamily RedHat 8 or newer the randomcron parameter is ignored.
The systemd timer for fetch-crl is already very random.

Default value: ``true``

##### <a name="cache_control_request"></a>`cache_control_request`

Data type: `Optional[Integer]`

Sends a cache-control max-age hint in seconds towards the server in the HTTP request.

Default value: ``undef``

##### <a name="capkgs"></a>`capkgs`

Data type: `Array[String[1]]`



Default value: `['ca-policy-egi-core']`

##### <a name="carepo"></a>`carepo`

Data type: `Stdlib::Httpurl`



Default value: `'https://repository.egi.eu/sw/production/cas/1/current/'`

##### <a name="carepo_gpgkey"></a>`carepo_gpgkey`

Data type: `Stdlib::Httpurl`



Default value: `'https://dist.eugridpma.info/distribution/igtf/current/GPG-KEY-EUGridPMA-RPM-3'`

## Defined types

### <a name="fetchcrlca"></a>`fetchcrl::ca`

Creates per CA configuration files.

#### Examples

##### Simple Example

```puppet
fetchcrl::ca{'EDG-Tutorial-CA':
  agingtolerance => 168
}
```

#### Parameters

The following parameters are available in the `fetchcrl::ca` defined type:

* [`name`](#name)
* [`anchorname`](#anchorname)
* [`nowarnings`](#nowarnings)
* [`noerrors`](#noerrors)
* [`httptimeout`](#httptimeout)
* [`agingtolerance`](#agingtolerance)
* [`crl_url`](#crl_url)

##### <a name="name"></a>`name`

The name of the CA to manage a configuration for.

##### <a name="anchorname"></a>`anchorname`

Data type: `String[1]`

The name of the CA to manage a configuration for.

Default value: `$title`

##### <a name="nowarnings"></a>`nowarnings`

Data type: `Boolean`

Should warnings be supressed for this CA.

Default value: ``false``

##### <a name="noerrors"></a>`noerrors`

Data type: `Boolean`

Should errors be supressed for this CA.

Default value: ``false``

##### <a name="httptimeout"></a>`httptimeout`

Data type: `Optional[Integer]`

The timeout for this CA.

Default value: ``undef``

##### <a name="agingtolerance"></a>`agingtolerance`

Data type: `Optional[Integer]`

The delay if failures before it is considered an error.

Default value: ``undef``

##### <a name="crl_url"></a>`crl_url`

Data type: `Array[Stdlib::Httpurl]`

A list of URLs to download CAs from

Default value: `[]`


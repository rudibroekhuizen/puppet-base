# == Define: base::packages
#
define base::packages (

  $ensure   = undef,
  $provider = undef,
  ) {

  package { $title:
    ensure   => $ensure,
    provider => $provider,
  }

}

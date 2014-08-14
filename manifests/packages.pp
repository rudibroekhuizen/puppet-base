# == Define: base::packages
#
define base::packages (
  $ensure = undef,
  ) {

  package { $title:
    ensure => $ensure,
  }

}

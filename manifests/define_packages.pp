# == Define: base::define_packages
#
define base::define_packages (
  $ensure = undef,
  ) {

  package { $title:
    ensure => $ensure,
  }

}

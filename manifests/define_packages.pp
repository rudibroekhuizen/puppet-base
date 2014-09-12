# == Define: base::define_packages
#
define base::define_packages (
  $ensure,
  $provider,
  ) {

  package { $title:
    ensure   => $ensure,
    provider => $provider,
  }

}

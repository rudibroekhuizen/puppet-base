# == Define: base::define_packages
#
define base::define_packages (
  $ensure   = under,
  $provider = undef,
  ) {

  package { $title:
    ensure   => $ensure,
    provider => $provider,
  }

}

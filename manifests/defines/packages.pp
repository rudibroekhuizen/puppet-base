# == Define: base::defines::packages
#
define base::defines::packages (
  $ensure   = undef,
  $provider = undef,
) {

  package { $title:
    ensure   => $ensure,
    provider => $provider,
  }

}

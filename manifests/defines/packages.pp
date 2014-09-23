# == Define: base::defines::packages
#
define base::defines::packages (
  $ensure   = under,
  $provider = undef,
  ) {

  package { $title:
    ensure   => $ensure,
    provider => $provider,
  }

}


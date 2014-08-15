# == Define: base::define_users
#
define base::define_users (

  $password = undef,
  $groups   = undef,
  $ensure   = undef,
  ){

  user { $title:
    password => $password,
    groups   => $groups,
    ensure   => $ensure,
  }

}

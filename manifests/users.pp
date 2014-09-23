# == Class: base::users
#
class base::users (
  $users_hash,
  $users_attribute_defaults,
  ){

  create_resources('base::defines::users', $users_hash, $users_attribute_defaults)
}

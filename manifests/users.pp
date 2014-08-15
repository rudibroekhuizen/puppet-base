# == Class: base::users
#
class base::users (
  $user_hash,
  $user_attribute_defaults,
  ){

  create_resources('base::define_users', $user_hash, $user_attribute_defaults)
}

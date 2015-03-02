# == Class: base::users
#
class base::users {

  create_resources('base::defines::users', $base::users_hash, $base::users_attribute_defaults)
}

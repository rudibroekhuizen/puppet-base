# == Class: base::packages
#
class base::packages {

case $::osfamily {
  debian: { create_resources('base::defines::packages', $base::packages_hash_debian, $base::packages_attribute_defaults) }
  redhat: { create_resources('base::defines::packages', $base::packages_hash_redhat, $base::packages_attribute_defaults) }
  }
}

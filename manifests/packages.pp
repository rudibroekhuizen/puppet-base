# == Class: base::packages
#
class base::packages {

case $::osfamily {
  debian: { create_resources('base::defines::packages', $::packages_hash_debian, $::packages_attribute_defaults) }
  redhat: { create_resources('base::defines::packages', $::packages_hash_redhat, $::packages_attribute_defaults) }
  }
}

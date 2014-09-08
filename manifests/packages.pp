# == Class: base::packages
#
class base::packages (
  $package_hash_debian,
  $package_hash_redhat,
  $package_attribute_defaults,
  ){

case $::osfamily {
  debian: { create_resources('base::define_packages', $package_hash_debian, $package_attribute_defaults) }
  redhat: { create_resources('base::define_packages', $package_hash_redhat, $package_attribute_defaults) }
  }
}

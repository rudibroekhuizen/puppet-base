# == Class: base::ppas
#
class base::ppas (
  $ppas_array,
  ){

case $::osfamily {
  debian: { create_resources('apt::ppa', $ppas_array) }
  }
}


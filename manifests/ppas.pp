# == Class: base::ppas
#
class base::ppas (
  $ppas_array,
  ){

case $::osfamily {
  apt::ppa { $ppas_array: }
  }
}


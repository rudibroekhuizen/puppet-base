# == Class: base::ppas
#
class base::ppas (
  $ppas_array,
  ){

case $::osfamily {
  debian: { apt::ppa { $ppas_array: }}
  }
  
}


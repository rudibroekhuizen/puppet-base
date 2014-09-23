# == Class: base::ppas
#
class base::ppas (
  $ppas_array,
  ){

case $::osfamily {
  debian: { 
    include apt
    apt::ppa { $ppas_array: }
    }
  }
  
}


# == Class: base::repos
#
class base::repos (
  $ppas_array,
  ){

case $::osfamily {
  debian: { 
    include apt
    apt::ppa { $ppas_array: }
    }
  }
  
}


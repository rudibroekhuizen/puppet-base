# == Class: base::repos
#
class base::repos (
  $repos_array_debian,
  ){

  case $::osfamily {
    debian: { 
      include apt
      apt::ppa { $ppas_array: }
    }
    redhat: {
      include yum
    }
  }
  
}


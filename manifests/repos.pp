# == Class: base::repos
#
class base::repos {

  case $::osfamily {
    debian: { 
      include apt
      apt::ppa { $::repos_array_debian: }
    }
    redhat: {
      include epel
    }
  }
  
}


# == Class: base::repos
#
class base::repos (
  $repos_array_debian,
  ){

  case $::osfamily {
    debian: { 
      include apt
      apt::ppa { $repos_array_debian: }
    }
    redhat: {
      class { 'yum':
        extrarepo => [ 'epel' ],
      }
    }
  }
  
}


# == Define: base::define_users
#
define base::define_users (

  $username = $title,
  $comment,
  $password,
  $groups,
  $ensure,
  $ssh_key,
  $shell, 

  ) {

  user { $username:
    ensure   => $ensure,
    password => $password,
    groups   => $groups,
    shell    => $shell,
  }

  group { $username: 
    ensure => present, 
  }  

}

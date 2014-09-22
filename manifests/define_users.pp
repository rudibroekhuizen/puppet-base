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

  file { "/home/${username}": 
    ensure  => directory, 
    owner   => $username, 
    group   => $username, 
    mode    => '0700', 
  } 

  wget::fetch { "${username} .screenrc":
    source      => "http://git.grml.org/f/grml-etc-core/etc/grml/screenrc_generic",
    destination => "/home/${username}/.screenrc",
    timeout     => 0,
    verbose     => false,
  }

}

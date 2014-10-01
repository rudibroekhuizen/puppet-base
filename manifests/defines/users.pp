# == Define: base::defines::users
#
define base::defines::users (
  $username = $title,
  $comment,
  $password,
  $email,
  $groups,
  $ensure,
  $ssh_key,
  $shell, 
) {

# Create wheel group
  group { 'wheel': 
    ensure => present,
  }

# Create user
  user { $username:
    ensure   => $ensure,
    password => $password,
    groups   => $groups,
    shell    => $shell,
  }

# Create group
  group { $username: 
    ensure => present, 
  }

# Create homedirectory
  file { "/home/${username}": 
    ensure  => directory, 
    owner   => $username, 
    group   => $username, 
    mode    => '0700',
    require => [Group["wheel"],
                Group["${username}"]],
  } 

# Create .ssh directory
file { "/home/${username}/.ssh":
    ensure  => directory,
    owner   => $username,
    group   => $username,
    mode    => '0600',
    require => File["/home/${username}"],
  }

# Create authorized_keys directory
 file { "/home/${username}/.ssh/authorized_keys":
    ensure  => present,
    owner   => $username,
    group   => $username,
    mode    => '0600',
    require => File["/home/${username}/.ssh"],
    }

# Add public key
 if $ssh_key {
    ssh_authorized_key { $email:
      ensure  => present,
      user    => $username,
      type    => $ssh_key['type'],
      key     => $ssh_key['key'],
      require => File["/home/${username}/.ssh/authorized_keys"],
    }
  }

# Download screen configuration file
  wget::fetch { "/home/${username}/.screenrc":
    source      => "http://git.grml.org/f/grml-etc-core/etc/grml/screenrc_generic",
    destination => "/home/${username}/.screenrc",
    timeout     => 0,
    verbose     => false,
    require     => File["/home/${username}"],
  }

# Download vim configuration file
  wget::fetch { "/home/${username}/.vim":
    source      => "http://git.grml.org/f/grml-etc-core/etc/vim/vimrc",
    destination => "/home/${username}/.vimrc",
    timeout     => 0,
    verbose     => false,
    require     => File["/home/${username}"],
  }

# Download zsh configuration file
  wget::fetch { "/home/${username}/.zshrc":
    source      => "http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc",
    destination => "/home/${username}/.zshrc",
    timeout     => 0,
    verbose     => false,
    require     => File["/home/${username}"],
  }

# Configure Git
  git::config { 'user.name':
    value => $comment,
  }

  git::config { 'user.email':
    value => $email,
  }

}


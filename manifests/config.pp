# == Class: base::config
#
class base::config {

# Make sure hosts file is ok
  host { $::fqdn:
    ensure       => 'present',
    host_aliases => [$::hostname, 'localhost'],
    ip           => $::ipaddress,
    target       => '/etc/hosts',
  }
  
# Create wheel group
  group { 'wheel': 
    ensure => present,
  }
  
# Set timezone using saz/timezone module
  class { 'timezone':
    timezone => 'Europe/Amsterdam',
  }

# Allow users belonging wheel group to use sudo
#  augeas { 'sudowheel':
#    context => '/files/etc/sudoers', # target file is /etc/sudoers
#    changes => [
#      'set spec[user = "%wheel"]/user %wheel',
#      'set spec[user = "%wheel"]/host_group/host ALL',
#      'set spec[user = "%wheel"]/host_group/command ALL',
#      'set spec[user = "%wheel"]/host_group/command/runas_user ALL',
#      'set spec[user = "%wheel"]/host_group/command/tag NOPASSWD',
#      ],
#  }
  sudo::conf { 'wheel':
    priority => 10,
    content  => "%wheel ALL=(ALL) NOPASSWD: ALL",
  }

  sudo::conf { 'vagrant':
    priority => 15,
    content  => "vagrant ALL=(ALL) NOPASSWD: ALL",
  }

  augeas { "sshd_config":
    context => "/files/etc/ssh/sshd_config",
    changes => [
      "set UseDNS 'no'",
      ],
    #notify  => Service["sshd"],
  }

  augeas { "sshGSSAPIauth":
    context => "/files/etc/ssh/sshd_config",
    changes => [
      "set GSSAPIAuthentication 'no'",
      ],
  }
  
  #facts::instance { 'owner_email':
  #  value => $base::owner_email
  #}
  
}

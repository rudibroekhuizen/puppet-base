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
  
# Allow users belonging wheel group to use sudo
  augeas { 'sudowheel':
	  context => '/files/etc/sudoers', # target file is /etc/sudoers
	  changes => [
	    'set spec[user = "%wheel"]/user %wheel',
	    'set spec[user = "%wheel"]/host_group/host ALL',
	    'set spec[user = "%wheel"]/host_group/command ALL',
	    'set spec[user = "%wheel"]/host_group/command/runas_user ALL',
            'set spec[user = '%wheel']/host_group/command/tag NOPASSWD',
	    ]
	}

 augeas { "sshdns":
  context => "/files/etc/ssh/sshd_config",
  changes => [
    "set UseDNS 'no'",
    ],
  }

  augeas { "sshGSSAPIauth":
    context => "/files/etc/ssh/sshd_config",
    changes => [
        "set GSSAPIAuthentication 'no'",
      ],
  }
  
}

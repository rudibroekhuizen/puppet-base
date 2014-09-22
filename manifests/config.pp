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
  
  wget::fetch { "grml-etc-core .screenrc":
    source      => 'http://git.grml.org/f/grml-etc-core/etc/grml/screenrc_generic',
    destination => '/etc/screenrc/.screenrc',
    timeout     => 0,
    verbose     => false,
  }
  
}

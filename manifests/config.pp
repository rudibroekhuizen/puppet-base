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
  
}

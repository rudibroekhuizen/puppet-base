# == Class: base
#
# Full description of class base here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { base:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class base (
  $repos_array_debian = [ 'ppa:webupd8team/atom',
                          'ppa:webupd8team/java',
                        ],
                        
  $owner_email = 'rudi.broekhuizen@naturalis.nl',
                
  $packages_attribute_defaults = { ensure => installed,
                                 },

  $packages_hash_debian = { 'puppet' => { ensure => latest,
                                        },

                            'htop'   => { ensure => latest,
                                        },
                          },
                         
  $packages_hash_redhat = { 'puppet' => { ensure => latest,
                                        },

                            'htop'   => { ensure => latest,
                                        },
                          },
                         
  $users_attribute_defaults = { ensure => present,
                              },
                             
  $users_hash = { 'rudi.broekhuizen' => { comment => 'Rudi Broekhuizen',
                                          email   => 'rudi.broekhuizen@naturalis.nl',
                                          groups  => ['wheel','sudo','adm','plugdev'],
                                          ensure  => present,
                                          shell   => '/bin/zsh',
                                          ssh_key => { type => "ssh-rsa",
                                                       key  => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDeRrVuojExYBWgIV7UlLfYLvzGpW9hSzrjl9qJ7Kb3E/x+kq2ruma3LXlvMzFXoCKJMYvqvXUFj2Dzwh+iJ2bCyh5ilWgTMLvAwzRl1LdAV8IbDVYNZGCHCzXkyxLMAEdxXMHVYl6N/q+RBP+HQCySpwOjv86c5PgXoL4BOnxLy5TAoxSsfvxRcHT42ThYK1C/R5QC8UoBdpJ1RBhQRjBJPMWp9zRyOafNwE7Iti15gKHp04bn9UGqHRTA1ul+Q6YEFzjoqUxe4VCHObM6BS/DpD++TPMXjzU+aeJ8tkxhmYkGRKYJx/KK3uaKPv+/EkODePvwTVshiQ8v9qOXx0YJ",
                                                     },
                                        },
               },
  ) {

# Various configure items
  class { 'base::config': }

# Install files
  class { 'base::files':
    require => Class ['base::config'],
  }

# Add repositories
  class { 'base::repos':
    require => Class ['base::files'],
  }

# Install packages
  class { 'base::packages':
    require => Class ['base::repos'],
  }
  
# Create users
  class { 'base::users':
    require => Class ['base::packages'],
  }  

}

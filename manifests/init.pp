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
  $repos_array_debian = undef,
  $vcsrepo_hash = undef,
  $owner_email = undef,
  $packages_attribute_defaults = undef,
  $packages_hash_debian = undef,
  $packages_hash_redhat = undef,
  $users_attribute_defaults = undef,
  $users_hash = undef,
  ) {

# Various configure items
  class { 'base::config': }

# Install files
  class { 'base::files':
    require => Class['base::config'],
  }

# Add repositories
  class { 'base::repos':
    require => Class['base::files'],
  }

# Install packages
  class { 'base::packages':
    require => Class['base::repos'],
  }
  
# Create users
  class { 'base::users':
    require => Class['base::packages'],
  }  

}

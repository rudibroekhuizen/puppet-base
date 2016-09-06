# == Class: base::files
#
class base::files {

  # Puppetfile
  file { '/etc/puppetlabs/puppet/Puppetfile':
    source  => 'puppet:///modules/role_base/Puppetfile',
  }

  # Hiera user data
  file { '/etc/puppetlabs/puppet/hieradata':
    source  => 'puppet:///modules/role_base',
    recurse => true
  }

}

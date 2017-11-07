# == Class: base::files
#
class base::files {

  # Puppetfile
  file { '/etc/puppet/Puppetfile':
    source  => 'puppet:///modules/role_base/Puppetfile',
  }

  # Hiera user data
  file { '/etc/puppet/data':
    source  => 'puppet:///modules/role_base',
    recurse => true
  }

}

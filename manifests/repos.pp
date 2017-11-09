# == Class: base::repos
#
class base::repos {

  # Add apt repo's
  if $repos_array_debian {
    case $::osfamily {
      debian: { 
        include apt
        apt::ppa { $base::repos_array_debian: }
      }
      redhat: {
        include epel
      }
    }
  }
  
  # Download repo's from Github, Subversion, etc.
  if $base::vcsrepo_hash {
    $base::vcsrepo_hash.each |$title, $vcsrepo| {
      vcsrepo { "/etc/puppetlabs/puppet/code/modules/${title}":
        provider => git,
        source   => $vcsrepo["source"],
        revision => $vcsrepo["revision"]
      }
    }
  }
}

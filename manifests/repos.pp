# == Class: base::repos
#
class base::repos {

  # Add apt repo's
  case $::osfamily {
    debian: { 
      include apt
      apt::ppa { $base::repos_array_debian: }
    }
    redhat: {
      include epel
    }
  }
  
  # Download repo's from Github, Subversion, etc.
  if $base::vcsrepo_hash {
    $base::vcsrepo_hash.each |$title, $vcsrepo| {
      vcsrepo { "/etc/puppetlabs/code/modules/${title}":
        provider => git,
        source   => $vcsrepo["source"],
        revision => $vcsrepo["revision"]
      }
    }
  }
}

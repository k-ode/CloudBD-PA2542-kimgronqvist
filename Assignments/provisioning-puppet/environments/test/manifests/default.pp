class nodejs {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
  }

  package { 'curl': 
    ensure => 'installed',
  }

  exec { 'nodejs-get-latest':
    command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
  }

  package { 'nodejs':
    ensure => 'latest',
    require => Exec['nodejs-get-latest'],
  }
}

include nodejs

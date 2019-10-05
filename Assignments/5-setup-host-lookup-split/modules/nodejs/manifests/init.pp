#
# Installs latest nodejs
#
class nodejs {
  package { 'curl':
    ensure  => latest,
    require => Exec['apt-get update']
  }

  exec { 'nodejs-get-latest':
    command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
  }

  package { 'nodejs':
    ensure  => latest,
    require => Exec['apt-get update', 'nodejs-get-latest'],
  }
}

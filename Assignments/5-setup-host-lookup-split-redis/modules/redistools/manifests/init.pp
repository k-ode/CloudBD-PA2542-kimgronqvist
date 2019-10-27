# 
# Installs latest redis-tools which includes redis-cli
#
class redistools {
  package { 'redis-tools':
    ensure  => latest,
    require => Exec['apt-get update'],
  }
}

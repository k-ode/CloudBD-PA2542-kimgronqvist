# 
# Installs latest redis
#
class redis {
  package { 'redis':
    ensure  => installed,
    require => Exec['apt-get update'],
  }

  file { '/etc/redis/redis.conf':
    ensure => present,
    path   => '/etc/redis/redis.conf',
    notify => Service['redis-server'],
    source => '/vagrant/redis.conf'
  }

  service { 'redis-server':
    ensure  => running,
    require => Package['redis']
  }
}

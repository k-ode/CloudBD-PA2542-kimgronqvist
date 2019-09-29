# 
# Installs latest mysql server and sets root password
#
class mysql {
  package { 'mysql-server':
    ensure  => latest,
    require => Exec['apt-get update'],
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server']
  }

  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot status',
    command => 'mysqladmin -uroot password root',
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }
}

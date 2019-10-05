# 
# Installs latest nginx
#
class nginx {
  package { 'nginx':
    ensure  => latest,
    require => Exec['apt-get update'],
  }

  service { 'nginx':
    ensure  => running,
    require => Package['nginx']
  }
}

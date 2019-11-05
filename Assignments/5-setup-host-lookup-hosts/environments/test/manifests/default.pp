exec { 'apt-get update':
  command => '/usr/bin/apt-get update';
}

# configure ips
class configurehosts {
  file { '/etc/hosts':
    path   => '/etc/hosts',
    source => '/vagrant/hosts'
  }
}

node default {
  notify { 'notify-default':
    message => 'Not configured'
  }
}

node 'appserver' {
  include configurehosts
}

node 'dbserver' {
  include configurehosts
}

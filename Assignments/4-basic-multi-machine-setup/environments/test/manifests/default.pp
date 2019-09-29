exec { 'apt-get update':
  command => '/usr/bin/apt-get update';
}

node default {
  notify { 'notify-default':
    message => 'Not configured'
  }
}

node 'appserver' {
  include nodejs
}

node 'dbserver' {
  include mysql
}

node 'web' {
  include nginx
}

node /tst(.*)$/ {
  notify { 'notify-tst':
    message => "Configured tst${1}"
  }
}

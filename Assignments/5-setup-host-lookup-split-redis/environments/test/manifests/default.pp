exec { 'apt-get update':
  command => '/usr/bin/apt-get update';
}

# Store ip to redis database
class storeiptoredis {
  if $facts['networking']['interfaces']['eth1'] {
    $ip = $facts['networking']['interfaces']['eth1']['ip']
  } else {
    $ip = $facts['networking']['interfaces']['eth0']['ip']
  }

  notify { 'notify-ip':
    message => $ip
  }

  exec { 'store-ip-to-redis':
    command => "/usr/bin/redis-cli -h ${::proxy_ip} SET ${::hostname} ${$ip}"
  }
}

node default {
  notify { 'notify-default':
    message => 'Not configured'
  }
}

node 'proxy' {
  include redis
}

node 'appserver' {
  include redistools
  include storeiptoredis

  notify { 'notify-proxy-ip':
    message => $proxy_ip
  }
}

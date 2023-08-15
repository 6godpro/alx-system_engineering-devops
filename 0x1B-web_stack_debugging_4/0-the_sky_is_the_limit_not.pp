# Re-configures the ULIMIT  NGINX
exec { 'Set ULIMIT':
  provider => 'shell',
  command  => "sed -i 's/-n 4096/-n 4097/g' /etc/default/nginx",
}

-> exec { 'Restart':
  provider => 'shell',
  command  => 'service nginx restart',
}

# Re-configures the ULIMIT  NGINX
exec { 'fix--for-nginx':
  provider => 'shell',
  command  => "sed -i 's:ULIMIT=\"-n 15\"::g' /etc/default/nginx",
}

exec { 'Restart NGINX':
  provider => 'shell',
  command  => 'service nginx restart',
}

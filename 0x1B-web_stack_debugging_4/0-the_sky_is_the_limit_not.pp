# Re-configures the ULIMIT  NGINX
exec { 'fix--for-nginx':
  provider => 'shell',
  command  => "sed -i 's.-n 15.-n 4096.g' /etc/default/nginx",
}

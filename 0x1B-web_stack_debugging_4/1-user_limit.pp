# change os configuration for holberton user
exec { 'change-os-configuration-for-holberton-user':
  provider => 'shell',
  command  => "sed -i 's:holberton.*nofile.*::g' /etc/security/limits.conf",
}

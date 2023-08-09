exec { 'update':
  provider => 'shell',
  command  => 'apt update -y',
}

-> exec { 'stop':
  provider => 'shell',
  command  => 'service apache2 stop',
}

-> exec { 'fix':
  provider => 'shell',
  command  => "sed -i 's.phpp.php.g' /var/www/html/wp-settings.php",
}

-> exec { 'restart':
  provider => 'shell',
  command  => 'service apache2 restart',
}
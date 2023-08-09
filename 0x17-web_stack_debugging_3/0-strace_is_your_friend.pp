# fixes a typo error in the apache config
exec { 'update':
  provider => 'shell',
  command  => 'apt update -y',
}

-> exec { 'stop':
  command => '/etc/init.d/apache2 stop',
}

-> exec { 'fix':
  provider => 'shell',
  command  => "sed -i 's.phpp.php.g' /var/www/html/wp-settings.php",
}

-> exec { 'restart':
  command => '/etc/init.d/apache2 restart',
}
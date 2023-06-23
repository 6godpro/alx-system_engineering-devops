# Creates a file in the /tmp directory.
file {'school':  # The file path
  ensure  => 'present',
  path    => '/tmp/school',
  content => 'I love Puppet',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
}
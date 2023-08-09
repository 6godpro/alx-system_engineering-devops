# Set up the SSH config file.
import stdlib
file_line { 'Turn off passwd auth':
  line   => 'PasswordAuthentication yes',
  match  => 'PasswordAuth',
  path   => '/etc/ssh/ssh_config',
}
file_line { 'Declare identity file':
  line   => 'IdentityFile ~/.ssh/school',
  path   => '/etc/ssh/ssh_config',
}
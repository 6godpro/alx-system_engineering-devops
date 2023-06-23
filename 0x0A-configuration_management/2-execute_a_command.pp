# Kills a process name 'killmenow'
  exec { 'killmenow':
  command => '/bin/pkill "killmenow"',
}
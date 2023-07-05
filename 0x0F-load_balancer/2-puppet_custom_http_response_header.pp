# Configures a new server.

# update machine
exec { 'Update':
  command => '/bin/apt-get update -y',
}

# install Nginx
package { 'Nginx':
  ensure   => installed,
  name     => 'nginx',
  provider => 'apt',
}

# create index.html page
exec { '/var/www/html/index.html':
  command => '/bin/echo "Hello World!" | /bin/tee /var/www/html/index.html > /dev/null 2>&1',
}

# configure nginx with a new server block
exec { 'server block config':
  command => '/bin/printf %s  "server {
  listen 80 default_server;
  listen [::]:80 default_server;

  root /var/www/html;
  index index.html index.htm;

  location /redirect_me {
  	   return 301 https://www.google.com;
  }

  location / {
           try_files \$uri \$uri/ =404;
  }
  add_header X-Served-By $HOSTNAME;
}" > /etc/nginx/sites-available/default',
}

# restart web server
exec { 'restart':
  command => '/sbin/service nginx restart',
}
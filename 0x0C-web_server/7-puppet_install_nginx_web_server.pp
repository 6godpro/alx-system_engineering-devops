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

# create an error404.html page
exec { '/var/www/html/error404.html':
  command => '/bin/echo "Ceci n\'est pas une page" | /bin/tee /var/www/html/error404.html > /dev/null 2>&1',
}

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
}" > /etc/nginx/sites-available/default',
}

exec { 'restart':
  command => '/sbin/service nginx restart',
}

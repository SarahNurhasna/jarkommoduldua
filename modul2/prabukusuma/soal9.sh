apt-get update
apt-get install nginx -y
apt-get install lynx -y
apt-get install php php-fpm -y
service nginx start

# cek instalasi
# php -v
# lynx google.com

mkdir /var/www/jarkom

# BUAT FILE INDEX.PHP HARUS MANUAL NANO
# touch /var/www/jarkom/index.php
# nano index.php
# echo '
# <?php
# $hostname = gethostname();
# $date = date('Y-m-d H:i:s');
# $php_version = phpversion();
# $username = get_current_user();



# echo "Hello World!<br>";
# echo "Saya adalah: $username<br>";
# echo "Saat ini berada di: $hostname<br>";
# echo "Versi PHP yang saya gunakan: $php_version<br>";
# echo "Tanggal saat ini: $date<br>";
# ?>
# ' > /var/www/jarkom/index.php

service php7.0-fpm start
# nano /etc/nginx/sites-available/jarkom
echo '
 server {

 	listen 80;

 	root /var/www/jarkom;

 	index index.php index.html index.htm index.nginx-debian.html;
 	server_name _;
 	location / {
 			try_files $uri $uri/ /index.php?$query_string;
 	}

 	# pass PHP scripts to FastCGI server
 	location ~ \.php$ {
 	        include snippets/fastcgi-php.conf;
 	        fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
 	}

    location ~ /\.ht {
 			deny all;
 	}

 	error_log /var/log/nginx/jarkom_error.log;
 	access_log /var/log/nginx/jarkom_access.log;
 }
' > /etc/nginx/sites-available/jarkom

# buat symlink
ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm -rf /etc/nginx/sites-enabled/default

service nginx restart
nginx -t

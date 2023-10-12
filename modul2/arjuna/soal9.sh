# LOAD BALANCER
apt-get update
apt-get install bind9 nginx -y
apt-get install lynx -y
apt-get install php -y
service nginx start

# cek instalasi
# php -v
# lynx google.com

echo 'upstream worker {
  server 10.42.3.2; # IP PrabuKusuma
  server 10.42.3.3; # IP Abimanyu
  server 10.42.3.4; # IP Wisanggeni
}

server {
  listen 80;
  server_name arjuna.e11.com www.arjuna.e11.com;

  location / {
    proxy_pass http://worker;
  }
}
' > /etc/nginx/sites-available/loadb-jarkom

# simpan symlink
ln -s /etc/nginx/sites-available/loadb-jarkom /etc/nginx/sites-enabled/loadb-jarkom

rm -rf /etc/nginx/sites-enabled/default

service nginx restart
nginx -t
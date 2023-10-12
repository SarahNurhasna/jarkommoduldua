# SOAL 5
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install dnsutils

echo '
nameserver 10.42.2.2 # IP yudhistira
' > /etc/resolv.conf

host -t PTR 10.42.2.2
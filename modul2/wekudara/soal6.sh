echo nameserver 192.168.122.1 > /etc/resolv.conf
# SOAL 6
# apt-get update
# apt-get install dnsutils -y

echo '
zone "abimanyu.e11.com" {
    type slave;
    masters { 10.42.2.2; }; // Masukan IP Yudhistira
    file "/var/lib/bind/abimanyu.e11.com";
};
' > /etc/bind/named.conf.local

service bind9 restart
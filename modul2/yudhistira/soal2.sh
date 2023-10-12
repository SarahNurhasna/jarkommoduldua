echo nameserver 192.168.122.1 > /etc/resolv.conf

# SOAL 2
# di yudhistira
# apt-get update
# apt-get install bind9 -y

echo '
zone "arjuna.e11.com" {
    type master;
    file "/etc/bind/jarkom/arjuna.e11.com";
};
' > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/arjuna.e11.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.e11.com. root.arjuna.e11.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.e11.com.
@       IN      A       10.42.3.5       ; IP ARJUNA
www     IN      CNAME   arjuna.e11.com.
@       IN      AAAA    ::1
' > /etc/bind/jarkom/arjuna.e11.com

service bind9 restart
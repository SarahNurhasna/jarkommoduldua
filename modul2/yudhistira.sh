echo nameserver 192.168.122.1 > /etc/resolv.conf

# SOAL 2
# di yudhistira
apt-get update
apt-get install bind9 -y

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

# SOAL 3
echo '
zone "arjuna.e11.com" {
type master;
file "/etc/bind/jarkom/arjuna.e11.com";
};

zone "abimanyu.e11.com" {
	type master;
	file "/etc/bind/jarkom/abimanyu.e11.com";
};
' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.e11.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      abimanyu.e11.com.
@               IN      A       10.42.3.3       ; IP ABIMANYU
www             IN      CNAME   abimanyu.e11.com.
@               IN      AAAA    ::1
' > /etc/bind/jarkom/abimanyu.e11.com

service bind9 restart

# SOAL 4
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      abimanyu.e11.com.
@               IN      A       10.42.3.3       ; IP ABIMANYU
www             IN      CNAME   abimanyu.e11.com.
parikesit       IN      A       10.42.3.3       ; IP ABIMANYU
@               IN      AAAA    ::1
' > /etc/bind/jarkom/abimanyu.e11.com

service bind9 restart


# SOAL 5
echo '
zone "arjuna.e11.com" {
type master;
file "/etc/bind/jarkom/arjuna.e11.com";
};

zone "abimanyu.e11.com" {
	type master;
	file "/etc/bind/jarkom/abimanyu.e11.com";
};

zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.42.10.in-addr.arpa";
};
' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/2.42.10.in-addr.arpa

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.e11.com. root.abimanyu.e11.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )        ; Negative Cache TTL
;
2.42.10.in-addr.arpa.   IN      NS      abimanyu.e11.com. ; reverse e byte pertama IP yudhistira
2                       IN      PTR     abimanyu.e11.com. ; byte ke4 yudhistira
' > /etc/bind/jarkom/2.42.10.in-addr.arpa

service bind9 restart


# SOAL 6
echo '
zone "arjuna.e11.com" {
type master;
file "/etc/bind/jarkom/arjuna.e11.com";
};

zone "abimanyu.e11.com" {
    type master;
    notify yes;
    also-notify { 10.42.2.3; }; // Masukan IP Werkudara
    allow-transfer { 10.42.2.3; }; // Masukan IP Werkudara
    file "/etc/bind/jarkom/abimanyu.e11.com";
};

zone "2.42.10.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.42.10.in-addr.arpa";
};
' > /etc/bind/named.conf.local

# after config wekudara
service bind9 stop
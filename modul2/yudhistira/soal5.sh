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
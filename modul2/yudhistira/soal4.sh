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
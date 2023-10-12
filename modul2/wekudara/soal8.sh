# SOAL 8
# nano /etc/bind/baratayuda/baratayuda.abimanyu.e11.com
echo '
;
; BIND data file for subdomain baratayuda.abimanyu.e11.com
;ping
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.e11.com. root.baratayuda.abimanyu.e11.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      baratayuda.abimanyu.e11.com.
@               IN      A       10.42.3.3       ; IP ABIMANYU
www             IN      CNAME   baratayuda.abimanyu.e11.com.
rjp             IN      A       10.42.3.3       ; IP ABIMANYU
www.rjp         IN      CNAME   rjp.baratayuda.abimanyu.e11.com.
' > /etc/bind/baratayuda/baratayuda.abimanyu.e11.com

service bind9 restart
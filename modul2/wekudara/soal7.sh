# SOAL 7
#  nano /etc/bind/named.conf.options
echo '
options {
        directory "/var/cache/bind";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0s placeholder.

        // forwarders {
        //      0.0.0.0;
        // };

        //=====================================================================$
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //=====================================================================$
        // dnssec-validation auto;
        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
    };       
' > /etc/bind/named.conf.options

# nano /etc/bind/named.conf.local
echo '
zone "abimanyu.e11.com" {
    type slave;
    masters { 10.42.2.2; }; // Masukan IP Yudhistira
    file "/var/lib/bind/abimanyu.e11.com";
};

zone "baratayuda.abimanyu.e11.com" {
    type master;
    file "/etc/bind/baratayuda/baratayuda.abimanyu.e11.com";
};
' > /etc/bind/named.conf.local

# buat direktori
mkdir /etc/bind/baratayuda

cp /etc/bind/db.local /etc/bind/delegasi/baratayuda.abimanyu.e11.com

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
' > /etc/bind/baratayuda/baratayuda.abimanyu.e11.com

service bind9 restart
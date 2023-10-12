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
# service bind9 stop
echo nameserver 192.168.122.1 > /etc/resolv.conf
# SOAL 2
echo '
nameserver 10.42.2.2 # IP yudhistira
' > /etc/resolv.conf

ping arjuna.e11.com -c 5
host -t A arjuna.e11.com
ping www.arjuna.e11.com

# SOAL 3
ping abimanyu.e11.com -c 5
host -t A abimanyu.e11.com
ping www.abimanyu.e11.com

# SOAL 4
ping parikesit.abimanyu.e11.com -c 5
host -t A parikesit.abimanyu.e11.com

# SOAL 5
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update
apt-get install dnsutils

echo '
nameserver 10.42.2.2 # IP yudhistira
' > /etc/resolv.conf

host -t PTR 10.42.2.2

# SOAL 6
echo '
nameserver 10.42.2.2 # IP YUDHISTIRA
nameserver 10.42.2.3 # IP werkudara
' > /etc/resolv.conf

ping abimanyu.e11.com -c 5

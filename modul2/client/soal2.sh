echo nameserver 192.168.122.1 > /etc/resolv.conf
# SOAL 2
echo '
nameserver 10.42.2.2 # IP yudhistira
' > /etc/resolv.conf

ping arjuna.e11.com -c 5
host -t A arjuna.e11.com
ping www.arjuna.e11.com
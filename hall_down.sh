hall=6;
/usr/bin/sshpass -p Abh+Adv+90  ssh  -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no sudheesh@192.168.5.10 '(echo "enable" ; echo "configure" ; echo "interface 0/'$hall'" ; echo "poe opmode shutdown" ; echo "exit" ; echo "exit" ; echo "exit") | telnet localhost ; exit;'

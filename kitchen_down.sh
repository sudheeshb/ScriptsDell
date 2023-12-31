#!/bin/bash

kitchen=8

/usr/bin/sshpass -p Abh+Adv+90  /usr/bin/ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  sudheesh@192.168.5.10 '(echo "enable" ; echo "configure" ; echo "interface 0/'$kitchen'" ; echo "poe opmode shutdown" ; echo "exit" ; echo "exit" ; echo "exit") | telnet localhost ; exit;'

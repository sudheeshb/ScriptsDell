sed  -i -e 's/.*nordvpn.com/      answer: ca1597.nordvpn.com/g' /home/sudheesh/Docker/Adguard/Conf/AdGuardHome.yaml
sudo docker restart adguardhome
/usr/bin/ssh    root@192.168.1.1   /root/Scripts/openvpnRestart.sh 

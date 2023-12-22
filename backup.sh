
ssh pfsense /root/Scripts/wakeDell5060.sh

#ssh pfsense /root/Scripts/wakenas.sh

#Wake up NAS via Webhook.  This will turn Zigbee Third reality 2 Plug
curl -X POST http://192.168.5.25:8123/api/webhook/-hfzkdYCYy-kRR63EDbAXdH9_

sleep 180;

ssh root@192.168.1.50  curl -d "QNAP\ Unraid\ On "  192.168.5.25:8125/home

#mount export folder to /mnt/disk1/paperless and perform backup
/home/sudheesh/Scripts/backup_paperless_to_unraid.sh

ssh sudheesh@dell5060  /home/sudheesh/Scripts/mount_backup_drives.sh

/home/sudheesh/Scripts/borg_backup_pfsense.sh
/home/sudheesh/Scripts/borg_backup_pfsense_unraid.sh
/home/sudheesh/Scripts/borg_backup_ha.sh
/home/sudheesh/Scripts/borg_backup_ha_unraid.sh

#This will also copy export folder ( unraid folder /mnt/disk1/paperless) into the external hard disk
/home/sudheesh/Scripts/borg_backup_docker.sh
/home/sudheesh/Scripts/borg_backup_docker_unraid.sh

curl -d "Backup Completed "  192.168.5.25:8125/home

sleep 20;

#unmouting unraid drive
sudo umount /home/sudheesh/Docker/paperless-ngx/export

ssh dell5060 sudo /sbin/shutdown -h now

#Shutdown unraid 
ssh root@192.168.1.50 /sbin/shutdown -h now
sleep 180;

# Turn off QNAP Plug
curl -X POST http://192.168.5.25:8123/api/webhook/-LyPeUwdhuik4CPDPqA53yLfP



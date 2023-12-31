
ssh pfsense /root/Scripts/wakeDell5060.sh
ssh pfsense /root/Scripts/wake_unraid.sh

sleep 180;

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

sleep 20;

ssh dell5060 sudo /sbin/shutdown -h now

#Shutdown unraid twice
#ssh root@192.168.1.54 /sbin/shutdown -h now
#sleep 180; 
#ssh root@192.168.1.54 /sbin/shutdown -h now


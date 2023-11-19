
ssh pfsense /root/Scripts/wakeDell5060.sh

sleep 180;



ssh sudheesh@dell5060  /home/sudheesh/Scripts/mount_backup_drives.sh


#mount export folder to /mnt/disk1/paperless and perform backup
/home/sudheesh/Scripts/backup_paperless_ssd.sh



/home/sudheesh/Scripts/borg_backup_pfsense.sh
/home/sudheesh/Scripts/borg_backup_ha.sh

#This will also copy export folder ( unraid folder /mnt/disk1/paperless) into the external hard disk
/home/sudheesh/Scripts/borg_backup_docker.sh


sleep 20;



ssh sudheesh@dell5060  /home/sudheesh/Scripts/unmount_backup_drives.sh

ssh dell5060 sudo /sbin/shutdown -h now



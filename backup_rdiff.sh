ssh sudheesh@dell5060  /home/sudheesh/Scripts/mount_backup_drives.sh

#dir_date=$(date  +"%Y_%b_%d_%H_%M")
rdiff-backup  -v4    --exclude /home/sudheesh/Docker/Frigate/Storage     --exclude \
     /home/sudheesh/Docker/Adguard/Work/data  --exclude /home/sudheesh/Docker/Unifi/Config/data/db \
     /home/sudheesh/Docker/  sudheesh@dell5060::/media/hdrive/Backup/rdiffBackup/Docker

rdiff-backup  -v5    /home/sudheesh/Scripts  sudheesh@dell5060::/media/hdrive/Backup/rdiffbackup/
rdiff-backup  -v5   /usr/share/hassio/homeassistant/backups  sudheesh@dell5060::/media/hdrive/Backup/rdiffBackup/HA
rdiff-backup  -v5   /nvme/Data/Backup/pfSense   sudheesh@dell5060::/media/hdrive/Backup/rdiffBackup/pfSense

#ssh sudheesh@dell5060  /home/sudheesh/Scripts/unmount_backup_drives.sh

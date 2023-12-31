ssh sudheesh@dell5060  /home/sudheesh/Scripts/mount_backup_drives.sh

dir_date=$(date  +"%Y_%b_%d_%H_%M")
rsync -av    --exclude 'Frigate/Storage'     --exclude  'Adguard/Work/data'  --exclude 'Unifi/Config/data/db' /home/sudheesh/Docker/  sudheesh@dell5060:/media/hdrive/Backup/dell3050/Docker/$dir_date
rsync -av     /home/sudheesh/Scripts  sudheesh@dell5060:/media/hdrive/Backup/dell3050/$dir_date
rsync -av     /usr/share/hassio/homeassistant/backups  sudheesh@dell5060:/media/hdrive/Backup/dell3050/HA/$dir_date
rsync -av     /nvme/Data/Backup/pfSense   sudheesh@dell5060:/media/hdrive/Backup/pfSense/$dir_date

ssh sudheesh@dell5060  /home/sudheesh/Scripts/unmount_backup_drives.sh

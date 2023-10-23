ARCHIVE=$(date '+%Y-%b-%d')
BACKUP_DIR="root@192.168.1.54:/mnt/disk1/Backup/pfSense"
borg create $BACKUP_DIR::$ARCHIVE /nvme/Data/Backup/pfSense
borg prune -v --list   --keep-within=30d $BACKUP_DIR
borg list $BACKUP_DIR

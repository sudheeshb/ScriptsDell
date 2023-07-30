ARCHIVE=$(date '+%Y-%b-%d')
BACKUP_DIR="sudheesh@dell5060:/media/hdrive/Backup/pfSense"
borg create $BACKUP_DIR::$ARCHIVE /nvme/Data/Backup/pfSense
borg prune -v --list   --keep-within=30d $BACKUP_DIR
borg list $BACKUP_DIR

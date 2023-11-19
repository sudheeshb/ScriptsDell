ARCHIVE=$(date '+%Y-%b-%d')

#Backing up to extenal hard drive
BACKUP_DIR="sudheesh@dell5060:/media/hdrive/Backup/pfSense"
borg create $BACKUP_DIR::$ARCHIVE /nvme/Data/Backup/pfSense
borg prune -v --list   --keep-within=30d $BACKUP_DIR


#Backing up to external SSD
BACKUP_DIR="sudheesh@dell5060:/media/ssd_1tb/Backup/pfSense"
borg create $BACKUP_DIR::$ARCHIVE /nvme/Data/Backup/pfSense
borg prune -v --list   --keep-within=30d $BACKUP_DIR


#borg list $BACKUP_DIR

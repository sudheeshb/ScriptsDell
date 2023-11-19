ARCHIVE=$(date '+%Y-%b-%d')
SOURCE_DIR="/usr/share/hassio/homeassistant/backups"
BACKUP_DIR="sudheesh@dell5060:/media/hdrive/Backup/HA"
borg create $BACKUP_DIR::$ARCHIVE  $SOURCE_DIR
borg prune -v --list   --keep-within=30d $BACKUP_DIR


SOURCE_DIR="/usr/share/hassio/homeassistant/backups"
BACKUP_DIR="sudheesh@dell5060:/media/ssd_1tb/Backup/HA"
borg create $BACKUP_DIR::$ARCHIVE  $SOURCE_DIR
borg prune -v --list   --keep-within=30d $BACKUP_DIR

#borg list $BACKUP_DIR

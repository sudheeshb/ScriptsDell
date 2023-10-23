ARCHIVE=$(date '+%Y-%b-%d')
SOURCE_DIR="/usr/share/hassio/homeassistant/backups"
BACKUP_DIR="root@192.168.1.54:/mnt/disk1/Backup/HA"
borg create $BACKUP_DIR::$ARCHIVE  $SOURCE_DIR
borg prune -v --list   --keep-within=30d $BACKUP_DIR
#borg list $BACKUP_DIR

ARCHIVE=$(date '+%Y-%b-%d')
SOURCE_DIR="/usr/share/hassio/homeassistant"
BACKUP_DIR="root@192.168.1.50:/mnt/cache/Backup/HA"

docker stop hass

borg create $BACKUP_DIR::$ARCHIVE  $SOURCE_DIR

docker start hass

borg prune -v --list   --keep-within=30d $BACKUP_DIR
#borg list $BACKUP_DIR

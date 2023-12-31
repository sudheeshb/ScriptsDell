ARCHIVE=$(date '+%Y-%b-%d')
SOURCE_DIR="/home/sudheesh/Docker"
BACKUP_DIR="root@192.168.1.50:/mnt/cache/Backup/Docker"
#EXLUDE_DIR=' --exclude '*.log'  --exclude '*.db'  --exclude 'Frigate/Storage'     --exclude  'Adguard/Work/data"


borg create  --stats   --exclude '*.log' \
     --exclude '*.db'  --exclude '/home/sudheesh/Docker/Frigate/Storage' \
     --exclude  '/home/sudheesh/Docker/Adguard/Work/data' \
     --exclude  '/home/sudheesh/Docker/Zabbix/zbx_env' \
     --exclude  'sh:**/.git' \
     $BACKUP_DIR::$ARCHIVE  $SOURCE_DIR


borg prune -v --list   --keep-within=30d $BACKUP_DIR


#borg list $BACKUP_DIR

#borg list $BACKUP_DIR::2023-Jul-24
#borg info $BACKUP_DIR::2023-Jul-24


# Order is important
#borg diff  sudheesh@dell5060:/media/hdrive/Backup/Docker::2023-Jul-24 2023-Jul-30

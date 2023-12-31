#Home Assistant


rclone delete   box:/Backup/HA/
rclone -v copy  /usr/share/hassio/homeassistant/backups/ box:/Backup/HA

#Docker

#rclone sync  /home/sudheesh/Docker/   box:/Backup/Docker   --exclude "/Frigate/Storage/**" --exclude '/Unifi/Config/data/db/**'  --exclude '/Adguard/Work/data/**'   --exclude  "/ProjectSend/**" --exclude "/Radarr/Config/MediaCover/**"   --exclude "/Sonarr/Config/MediaCover/**"  --exclude "/.git/**" 

find /home/sudheesh/Docker/ \( -iname "*.yaml" -o  -iname "*.yml" -o -iname "*.sh" \)   -print  |xargs  tar -cf ~/Test/Docker.tar
rclone delete   box:/Backup/Docker/
rclone copy /home/sudheesh/Test/  box:/Backup/Docker
rm ~/Test/Docker.tar



tar -cvf  ~/Test/Scripts.tar ~/Scripts/ 

rclone copy /home/sudheesh/Test/  box:/Backup/Scripts 
rm ~/Test/Scripts.tar

#pfSense

tar -cvf  ~/Test/pfSense.tar /nvme/Data/Backup/pfSense/
rclone copy /home/sudheesh/Test/    box:/Backup/pfSense 
rm ~/Test/pfSense.tar


#Cronjobs
#sudo rclone sync /var/spool/cron/crontabs  box:/Backup/Cron 

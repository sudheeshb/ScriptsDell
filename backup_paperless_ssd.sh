cd  /home/sudheesh/Docker/paperless-ngx
#docker-compose down;



# Mount the ssd from the backuo device
sudo mount -t nfs   192.168.1.75:/media/ssd_1tb/Backup/Paperless ~/Docker/paperless-ngx/export


# Copy the paperless to ssd
sudo docker exec paperless_webserver_1 document_exporter ../export

#Copy the paperless from ssd to external hard drive
ssh dell5060   /home/sudheesh/Scripts/copy_paperless_to_hd_drive.sh 

sudo umount /home/sudheesh/Docker/paperless-ngx/export


#docker-compose up -d;

cd  /home/sudheesh/Docker/paperless-ngx
#docker-compose down;



# Mount the Unraid folder
sudo mount -t nfs   192.168.1.50:/mnt/user/Paperless ~/Docker/paperless-ngx/export
sudo docker exec paperless-webserver-1 document_exporter ../export

#sudo umount /home/sudheesh/Docker/paperless-ngx/export


#docker-compose up -d;

find /home/sudheesh/Docker/ \( -iname "*.yaml" -o  -iname "*.yml" -o -iname "*.sh" \)   -print  |xargs  tar -czf ~/Test/Docker_tar.gz
scp  ~/Test/Docker_tar.gz sputh@192.168.1.60:/Users/sputh/Box\\\ Sync/Scripts/
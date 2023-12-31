sudo docker network create -d macvlan -o parent=enp2s0   --subnet 192.168.5.0/24   --gateway 192.168.5.1   --ip-range 192.168.5.192/27   --aux-address 'host=192.168.5.223'   mynet
sudo ip link add mynet_host link enp2s0 type macvlan  mode bridge
sudo ip addr add 192.168.5.223/32 dev mynet_host
sudo ip link set mynet_host up
sudo ip route add 192.168.5.192/27 dev mynet_host

#Only the below is needed.   Caveat is host ( 192.168.5.25 ) cannot access the docker.  

sudo docker network create -d macvlan -o parent=enp2s0   --subnet 192.168.5.0/24   --gateway 192.168.5.1   --ip-range 192.168.5.253/32      myne

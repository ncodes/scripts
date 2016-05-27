#sudo apt-get update
#sudo apt-get install iptables-persistent

sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT			
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT									
sudo iptables -I INPUT 1 -i lo -j ACCEPT			
sudo iptables -A INPUT -p tcp -m tcp -s 41.58.48.115,197.210.0.0/16 --dport 27017 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp -s 41.58.48.115,197.210.0.0/16 --dport 6379 -j ACCEPT								
sudo iptables -A INPUT -j DROP

sudo invoke-rc.d iptables-persistent save			 
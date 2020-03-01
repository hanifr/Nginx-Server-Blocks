# Nginx Server Blocks
 Nginx server blocks setup for Digitalocean Droplet
 
  How to use the setup tool?
 First you need to add username to your server, then clone the repo, and then run the ini.sh file. That's all.
 
 $ adduser username
 $ usermod -aG sudo username
 $ su - username
 $ git clone https://github.com/hanifr/Nginx-Server-Blocks.git
 $ cd Nginx-Server-Blocks
 $ sudo chmod +x init.sh
 $ ./init.sh

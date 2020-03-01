#!/bin/bash
# Colors
_CYAN=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_GREEN=`tput setaf 5`
_GREEN=`tput setaf 6`
_RESET=`tput sgr0`

echo "${_GREEN}Installation Progress....WEBSITE SETUP :: Started${_RESET}"
# Please input your your domain name
sudo mkdir -p /var/www/example.com/html
sudo chown -R $USER:$USER /var/www/example.com/html
sudo chmod -R 755 /var/www/example.com

cat >/var/www/example.com/html/index.html <<EOL
<html>
    <head>
        <title>Welcome to example.com!</title>
    </head>
    <body>
        <h1>Success!  The example.com server block is working!</h1>
    </body>
</html>
EOL

cat >$HOME/Nginx-Server-Blocks/example.com.html <<EOL
 server {
            listen 80;
            listen [::]:80;
        
            root /var/www/example.com/html;
            index index.php index.html index.htm index.nginx-debian.html;
        
            server_name example.com www.example.com;
        
            location / {
                    try_files $uri $uri/ =404;
            }
            
            location ~ \.php$ {
                    include snippets/fastcgi-php.conf;
                    fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
            }
    
            location ~ /\.ht {
                    deny all;
            }
        }
EOL
sudo cp $HOME/Nginx-Server-Blocks/example.com.html /etc/nginx/sites-available/example.com
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
echo

# Check if the Nginx configurations is OK no errors
sudo nginx -t

# Restart Nginx to enable the configuration changes   
sudo systemctl restart nginx
. certbot.sh

echo "${_GREEN}Installation Progress....WEBSITE SETUP :: Completed${_RESET}"
echo 
echo "${_GREEN}Please run \"sudo nginx -t\" to verify the settings${_RESET}"
echo 
echo "${_GREEN}Please run \"sudo systemctl restart nginx\" to enable the new settings${_RESET}"
echo
echo "${_GREEN}If you wish to deploy MySQL Database system, please do the following${_RESET}"
echo
echo "${_GREEN}To install MySQL database, run \"./maria_db.sh\"${_RESET}"
echo

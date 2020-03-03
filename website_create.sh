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
echo "${_CYAN}Please Enter your domain name${_RESET} $_domain"
                read -p "Enter your Domain: " _domain
echo "${_CYAN}You have entered $_domain for your domain name${_RESET}"

sudo mkdir -p /var/www/$_domain/html
sudo chown -R $USER:$USER /var/www/$_domain/html
sudo chmod -R 755 /var/www/$_domain

cat >/var/www/$_domain/html/index.html <<EOL
<html>
    <head>
        <title>Welcome to $_domain!</title>
    </head>
    <body>
        <h1>Success!  The $_domain server block is working!</h1>
    </body>
</html>
EOL

cat >$HOME/Nginx-Server-Blocks/$_domain.html <<EOL
 server {
            listen 80;
            listen [::]:80;
        
            root /var/www/$_domain/html;
            index index.php index.html index.htm index.nginx-debian.html;
        
            server_name $_domain www.$_domain;
        
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
sudo cp $HOME/Nginx-Server-Blocks/$_domain.html /etc/nginx/sites-available/$_domain
sudo ln -s /etc/nginx/sites-available/$_domain /etc/nginx/sites-enabled/
echo

# Check if the Nginx configurations is OK no errors
sudo nginx -t

# Restart Nginx to enable the configuration changes   
sudo systemctl restart nginx
echo "${_GREEN}Also Change $_domain to your domain_name \"sudo nano certbot.sh\"${_RESET}"
echo
echo "${_GREEN}Once finish, hit ctrl + o to save and ctrl + x to exit${_RESET}"
echo
echo "${_GREEN}To secure your website, run \"./certbot.sh.sh\"${_RESET}"
echo

#. certbot.sh

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

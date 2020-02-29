#!/bin/bash
echo "${_MAGENTA}Installation Progress....WEBSITE SETUP :: Started${_RESET}"
# Please input your your domain name
sudo mkdir -p /var/www/example.com/html
sudo chown -R $USER:$USER /var/www/example.com/html
cat >/var/www/example.com/html/index.html <<EOL
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
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
echo
echo "${_RED}Avoid any possible hash bucket memory problem do the following${_RESET}"
echo
echo "${_RED}Execute \"sudo nano /etc/nginx/nginx.conf\"${_RESET}"
echo
echo "${_RED}Uncomment the line \"server_names_hash_bucket_size\"${_RESET}"
echo " ..."
echo " http {"
echo "     ..."
echo "      \"server_names_hash_bucket_size 64;\""
echo "     ..."
echo "    }"
echo
echo "${_RED}Once finish, hit ctrl + o to save and ctrl + x to exit${_RESET}"
echo

# Check if the Nginx configurations is OK no errors
sudo nginx -t

# Restart Nginx to enable the configuration changes   
sudo systemctl restart nginx
. certbot.sh
echo "${_MAGENTA}Installation Progress....WEBSITE SETUP :: Completed${_RESET}"


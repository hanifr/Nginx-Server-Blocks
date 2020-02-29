#!/bin/bash

# Maintaining the updated version of Certbot
sudo add-apt-repository ppa:certbot/certbot
    
# Install Certbot's Nginx package
sudo apt install python-certbot-nginx

# Allowing Nginx Full Configuration
sudo ufw allow 'Nginx Full'
    
# Delete Nginx HTTP Configuration
sudo sudo ufw delete allow 'Nginx HTTP'

# Get Let's Encrypt certificate for example.com
sudo certbot --nginx -d example.com -d www.example.com
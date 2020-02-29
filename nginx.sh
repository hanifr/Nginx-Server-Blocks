#!/bin/bash
echo "${_MAGENTA}Installation Progress....Nginx :: Started${_RESET}"
sudo apt install nginx
sudo ufw allow 'Nginx HTTP'
sudo systemctl reload nginx
sudo systemctl enable nginx
echo "${_MAGENTA}Installation Progress....Nginx :: Completed${_RESET}"
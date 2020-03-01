#!/bin/bash
# Colors
_CYAN=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_MAGENTA=`tput setaf 5`
_GREEN=`tput setaf 6`
_RESET=`tput sgr0`

echo "${_MAGENTA}Installation Progress....Nginx :: Started${_RESET}"
sudo apt install nginx
sudo ufw allow 'Nginx HTTP'
sudo systemctl reload nginx
sudo systemctl enable nginx
echo "${_MAGENTA}Installation Progress....Nginx :: Completed${_RESET}"
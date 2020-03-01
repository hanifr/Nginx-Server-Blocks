#!/bin/bash
# Colors
_CYAN=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_MAGENTA=`tput setaf 5`
_GREEN=`tput setaf 6`
_RESET=`tput sgr0`

sudo apt install mariadb-server php-mysql
    
# Check MariaDB Status
sudo systemctl status mysql
    
# MariaDB not allow root login from anywhere accept shell
# Add other user
echo "${_MAGENTA}Please do the following${_RESET}"
echo "${_CYAN}\"sudo mysql\"${_RESET}"
echo
echo "${_CYAN}\"mysql > CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';\"${_RESET}"
echo
echo "${_CYAN}\"mysql > GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';\"${_RESET}"
echo
echo "${_CYAN}\"mysql > FLUSH PRIVILEGES;\"${_RESET}"
echo
echo "${_CYAN}\"mysql > quit\"${_RESET}"
echo

   

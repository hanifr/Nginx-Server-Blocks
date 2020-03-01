#!/bin/bash
# Colors
_RED=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_MAGENTA=`tput setaf 5`
_GREEN=`tput setaf 6`
_RESET=`tput sgr0`
echo "${_GREEN}Installation Progress....MySQL Database System :: Started${_RESET}"
echo
sleep 5
sudo apt install mariadb-server php-mysql
echo "${_GREEN}Now Checking MySQL Database status${_RESET}"
echo
# Check MariaDB Status
sudo systemctl status mysql
    
# MariaDB not allow root login from anywhere accept shell
# Add other user
echo "${_MAGENTA}Please do the following${_RESET}"
echo "${_YELLOW}\"sudo mysql\"${_RESET}"
echo
echo "${_YELLOW}\"mysql > CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';\"${_RESET}"
echo
echo "${_YELLOW}\"mysql > GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';\"${_RESET}"
echo
echo "${_YELLOW}\"mysql > FLUSH PRIVILEGES;\"${_RESET}"
echo
echo "${_YELLOW}\"mysql > quit\"${_RESET}"
echo
echo "${_GREEN}Installation Progress....MySQL Database System :: Completed${_RESET}"
echo 
   

#!/bin/bash
# Colors
_CYAN=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_MAGENTA=`tput setaf 5`
_RED=`tput setaf 6`
_RESET=`tput sgr0`

VERSION=1.0

echo "Installation of Nginx Server Blocks for Digitalocean Droplet v$VERSION."
echo "${_GREEN}(please report issues to tronexia@gmail.com email with full output of this script with extra \"-x\" \"bash\" option)${_RESET}"

if [ "$(id -u)" == "0" ]; then
  echo "WARNING: Generally it is not adviced to run this script under root"
fi

if [ -z $HOME ]; then
  echo "ERROR: Please define HOME environment variable to your home directory"
  exit 1
fi

if [ ! -d $HOME ]; then
  echo "ERROR: Please make sure HOME directory $HOME exists"
  exit 1
fi

echo "${_CYAN}Installation Progress....${_RESET}"
 sudo apt-get update
# Adding privilage to setup files
chmod +x $HOME/nginx-server-blocks/nginx.sh
chmod +x $HOME/nginx-server-blocks/website_create.sh
chmod +x $HOME/nginx-server-blocks/certbot.sh
chmod +x $HOME/nginx-server-blocks/maria_db.sh

. nginx.sh
sleep 5
echo
echo "${_RED}Please point your domain_name to your Digitalocean droplet${_RESET}"
echo
echo "${_RED}Change example.com to your domain_name \"sudo nano website_create.sh\"${_RESET}"
echo
echo "${_RED}Once finish, hit ctrl + o to save and ctrl + x to exit${_RESET}"
echo
echo "${_RED}Also Change example.com to your domain_name \"sudo nano certbot.sh\"${_RESET}"
echo
echo "${_RED}Once finish, hit ctrl + o to save and ctrl + x to exit${_RESET}"
echo
echo "${_RED}To setup your website to your domain_name, run \"./website_create.sh\"${_RESET}"
echo




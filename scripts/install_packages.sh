#!/bin/bash
echo "* Install packages..."
apt update

# ----- package list
# Apps
echo "> Install Terminal apps..."
terminal_apps_optional="tmuxinator ctags figlet ncdu ranger neofetch w3m w3m-img "
apt install -y wget curl vim git tmux tree xclip jq htop docker.io lsof ${terminal_apps_optional}

echo "> Install GNOME tools..."
is_gnome_installed=`env | grep XDG_CURRENT_DESKTOP`

if [[ -z ${is_gnome_installed} ]]; then
 echo "! No GUI environment detected."
else
 gui_apps_required= gui_apps_optional="slack discord terminator qdirstat steam-launcher libreoffice"
 apt install -y gnome-tweak-tool gnome-shell-extensions gnome-shell-extension-dashtodock ${gui_apps_optional}
fi 


#!/bin/bash

########
##Built to quickly get my fresh Fedora install up to speed
########

##Update the base system before adding rpmfusion repo
sudo dnf -y update
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

##Get the desired system hostname
read -p "Enter hostname: " computerName
sudo hostnamectl hostname "$computerName"

##Install a few packages.
sudo dnf install -y gnome-tweaks gnome-extensions-app papirus-icon-theme mozilla-fira-* google-roboto-* fira-code* gnome-shell-extension-user-theme vim-enhanced

##Install Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

##Set a few desktop options
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'
gsettings set org.gnome.desktop.interface font-name 'Noto Sans 11'
gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Noto Sans Mono 10'
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

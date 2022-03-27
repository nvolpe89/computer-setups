#!/bin/bash

# run updates
dnf check-update
sudo dnf upgrade --refresh -y

# install material shell
sudo dnf install gnome-shell-extension-material-shell -y

# enable material shell
gnome-extensions enable material-shell@papyelgringo

#######################
## INSTALL DEPENDANCIES
#######################

# add flathub repo to flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

###################
## INSTALL SOFTWARE
###################

# install brave browser
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser -y

# install telegram
flatpak install flathub org.telegram.desktop -y

# install 1password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password -y

# install howdy
sudo dnf copr enable principis/howdy
sudo dnf --refresh install howdy -y

#reboot system
sudo shutdown -r now

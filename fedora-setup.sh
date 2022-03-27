#!/bin/bash

# run updates
dnf check-update
sudo dnf upgrade --refresh -y

# install material shell
sudo dnf install gnome-shell-extension-material-shell

# enable material shell
gnome-extensions enable material-shell@papyelgringo

# INSTALL SOFTWARE

# install brave browser
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# install telegram
flatpak install flathub org.telegram.desktop

# install 1password
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install 1password

#reboot system
sudo shutdown -r now

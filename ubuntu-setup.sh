#!/bin/bash

# run updates
sudo apt update -y
sudo apt upgrade -y

# install material shell
# sudo apt install gnome-shell-extension-material-shell -y

# enable material shell
# gnome-extensions enable material-shell@papyelgringo

#######################
## INSTALL DEPENDANCIES
#######################

# install flatpak and add repo
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

###################
## INSTALL SOFTWARE
###################

# install brave browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# install microsoft edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
sudo apt update && sudo apt install microsoft-edge-stable

# install telegram
flatpak install flathub org.telegram.desktop -y

# install flameshot
flatpak install flathub org.flameshot.Flameshot

# install ente auth
wget https://github.com/ente-io/ente/releases/download/auth-v2.0.54/ente-auth-v2.0.54-x86_64.AppImage
chmod a+x ente-auth-*.AppImage
./ente-auth-*.AppImage

# install 1password
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
 curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
 sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
 curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update && sudo apt install 1password

# install tailscale
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt-get update
sudo apt-get install tailscale

# install remmina
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# In order to have H.264 codecs
flatpak install org.freedesktop.Platform
flatpak install org.freedesktop.Platform.openh264
flatpak install --user flathub org.remmina.Remmina
flatpak run --user org.remmina.Remmina

# install cloudflare warp
# sudo apt install cloudflare-warp

# install howdy
## be sure to run 'sudo howdy add' to setup facial recognition
# sudo add-apt-repository ppa:boltgolt/howdy
# sudo apt update
# sudo apt install howdy

#reboot system
sudo shutdown -r now

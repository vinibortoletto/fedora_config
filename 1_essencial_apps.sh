#!/bin/bash
source ./.functions.sh

echo_doing 'Enabling Flatpak and installing apps'
sudo dnf -y install flatpak 
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 
sudo flatpak install -y flathub org.qbittorrent.qBittorrent 
sudo flatpak install -y flathub org.videolan.VLC 
sudo flatpak install -y flathub com.visualstudio.code 
sudo flatpak install -y flathub com.valvesoftware.Steam 
sudo flatpak install -y flathub com.brave.Browser 
sudo flatpak install -y flathub us.zoom.Zoom
sudo flatpak install -y flathub com.mattjakeman.ExtensionManager
echo_done

reboot_prompt
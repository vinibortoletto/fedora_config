#!/bin/bash
source ./.functions.sh

echo_doing 'Configuring DNF'
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf
echo "keepcache=True" | sudo tee -a /etc/dnf/dnf.conf
echo_done

echo_doing 'Enabling RPM Fusion'
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
&& sudo dnf groupupdate -y core
echo_done

echo_doing 'Installing Media Codecs'
sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin \
&& sudo dnf groupupdate -y sound-and-video
echo_done

echo_doing 'Copying Wallpapers to Pictures folder'
cp -r Wallpapers ~/Pictures
echo_done

echo_doing 'Installing Fira Code and Meslo fonts'
cp -r fonts/fira_code ~/.local/share/fonts
cp -r fonts/meslo_lgs ~/.local/share/fonts
echo_done

echo_doing 'Removing Firefox'
sudo dnf remove firefox -y
rm -rf ~/.mozilla
rm -rf ~/.cache/mozilla
echo_done

echo_doing 'Enabling dark theme (VSCode theme fix)'
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
echo_done

reboot_prompt
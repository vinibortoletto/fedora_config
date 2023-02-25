# Fedora 37 System Configuration

## DNF Configuration
```
sudo nano /etc/dnf/dnf.conf
```

Add the following lines:
```
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
```

## Enable RPM Fusion
```
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
&& sudo dnf groupupdate -y core
```


## Install Media Codecs
```
sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin \
&& sudo dnf groupupdate -y sound-and-video
```

## Reboot

## Configure Git
```
git config --global user.email "ovinibortoletto@gmail.com" \
&& git config --global user.name "Vinicius Bortoletto"
```

## Remove Firefox 
```
sudo dnf remove firefox -y \
&& rm -rf ~/.mozilla \
&& rm -rf ~/.cache/mozilla
```

## Enable dark theme (VSCode theme fix)
```
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
```

## Enable Flatpak and install apps
```
sudo dnf -y install flatpak \
&& sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo \
&& sudo flatpak install -y flathub org.qbittorrent.qBittorrent \
&& sudo flatpak install -y flathub org.videolan.VLC \
&& sudo flatpak install -y flathub com.visualstudio.code \
&& sudo flatpak install -y flathub com.valvesoftware.Steam \
&& sudo flatpak install -y flathub com.brave.Browser \
&& sudo flatpak install -y flathub us.zoom.Zoom
```

## Installing Docker and Docker Compose
```
sudo dnf -y install docker docker-compose \
&& sudo systemctl start docker \
&& sudo systemctl enable docker \
&& sudo usermod -aG docker $USER
```

## Installing Zsh and Oh My Zsh
```
sudo dnf install zsh util-linux-user -y \
&& chsh -s $(which zsh) \
&& sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Reboot

## Install NVM and Node.js 16
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```
## Reboot
```
nvm i 16
```
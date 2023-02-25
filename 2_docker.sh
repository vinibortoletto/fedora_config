#!/bin/bash
source ./.functions.sh

echo_doing 'Installing Docker and Docker Compose'

sudo dnf -y install docker docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

echo_done

reboot_prompt

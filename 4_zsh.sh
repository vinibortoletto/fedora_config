#!/bin/bash
source ./.functions.sh

echo_doing 'Installing Zsh and Oh My Zsh'

sudo apt install -y zsh util-linux-user
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo_done

reboot_prompt




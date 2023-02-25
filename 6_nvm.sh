#!/bin/bash
source ./.functions.sh

echo_doing 'Installing NVM'

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
echo "Reboot before installing Node"

echo_done

reboot_prompt





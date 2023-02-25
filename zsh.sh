
#!/bin/bash
source ./.echo_functions.sh

echo_doing 'Installing Zsh and Oh My Zsh'
sudo dnf install zsh util-linux-user -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo_done

reboot_prompt
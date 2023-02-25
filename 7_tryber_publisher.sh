#!/bin/bash
source ./.functions.sh

echo_doing 'Installing Tryber Publisher'

git clone git@github.com:tryber/student-repo-publisher.git ~/student-repo-publisher
cd ~/student-repo-publisher
bash publisher-config.sh

echo_done

reboot_prompt





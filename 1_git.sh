#!/bin/bash

source ./.functions.sh


echo_doing 'Configuring Git'

git config --global user.email "ovinibortoletto@gmail.com"
git config --global user.name "Vinicius Bortoletto"
sudo dnf -y install gh
gh auth login

echo_done

reboot_prompt

#!/bin/bash

yellow='\033[33m'
green='\033[32m'
reset='\033[0m'

echo_doing () {
  local text="# $1..."
  echo -e "${yellow}${text}${reset}"
}

echo_done () {
  echo -e "${green}# Done!${reset}"
}

reboot_prompt() {
  read -p "Do you want to reboot your system now? [y/n] " choice

  case "$choice" in
    y|Y )
      reboot
      ;;
    n|N )
      exit 0
      ;;
    * )
      echo "Invalid choice. Please enter 'y' or 'n'."
      exit 1
      ;;
  esac
}


#!/bin/env bash

# Install kbct on archlinux


KBCT_BIN_URL="https://github.com/samvel1024/kbct/releases/download/v0.1.0/kbct-x86_64.AppImage"
KBCT_CONFIG_URL="https://gist.githubusercontent.com/KarimullinArthur/28434b2c7a392480d64221b79c48449c/raw/5a6db5dfd0f5bfccca666dd0ebe39b2079f8443c/kbct.yaml"
KBCT_DEAMON_URL="https://gist.githubusercontent.com/KarimullinArthur/28434b2c7a392480d64221b79c48449c/raw/5a6db5dfd0f5bfccca666dd0ebe39b2079f8443c/kbct.service"

RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'
RESET='\e[0m'


if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Error: this scirpt must be run as root${RESET}"
    exit 1
fi

[ $SUDO_USER ] && USERNAME=$SUDO_USER || USERNAME=`whoami`

if pacman -Qi wget; then
    echo "wget is installed"
else
    pacman -S --noconfirm wget
fi

pacman -S --noconfirm fuse2

wget $KBCT_BIN_URL && mv kbct-x86_64.AppImage /usr/bin/kbct
chmod +x /usr/bin/kbct
modprobe uinput

wget $KBCT_DEAMON_URL && mv ./kbct.service /etc/systemd/system/kbct.service
sudo wget $KBCT_CONFIG_URL && mv ./kbct.yaml /home/$USERNAME/.config/kbct.yaml

systemctl daemon-reload
systemctl enable kbct
systemctl start kbct

echo -e "${GREEN}Kbct is seccesfull installed${RESET}"
echo "Deamon located at /etc/systemd/system/kbct.service"
echo "Config located at /home/$USERNAME/.config/kbct.yaml"

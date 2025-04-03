
# Install main pkgs
sudo pacman -S\
    neovim\
    git\
    htop


# install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si



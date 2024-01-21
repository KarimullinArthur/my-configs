#!/bin/sh

cd ~
ln -s ~/.config/my-configs/zsh/antigen.zsh
ln -s ~/.config/my-configs/zsh/.zshrc
ln -s ~/.config/my-configs/tmux/.tmux.conf
ln -s ~/.config/my-configs/tmux/.tmux.conf.local

cd ~/.config
ln -s ~/.config/my-configs/sway
ln -s ~/.config/my-configs/waybar
ln -s ~/.config/my-configs/nvim

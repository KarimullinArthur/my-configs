# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything


# ____        __             _ _   
#|  _ \  ___ / _|_   _  __ _| | |_ 
#| | | |/ _ \ |_| | | |/ _` | | __|
#| |_| |  __/  _| |_| | (_| | | |_ 
#|____/ \___|_|  \__,_|\__,_|_|\__|
#                                  

# __  __       
#|  \/  |_   _ 
#| |\/| | | | |
#| |  | | |_| |
#|_|  |_|\__, |
#        |___/ 
#Фикс запуска tmux alias
#tmux="TERM=xterm && tmux" 

#Vi mode
set -o vi

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

bind -m vi-command '"\C-i":complete'
bind -m vi-command '"\C-i":complete'

#Алиасы
alias emacs="emacs -nw"

alias w3m="w3m -o auto_image=FALSE"
alias w3m-image="w3m -o auto_image=TRUE"
alias get="termux-clipboard-get"

#Добавляем свой /bin в домашней директории
export PATH=~/bin:"$PATH" 

#Дефолтный редактор - neovim
export EDITOR=nvim

#ipdb & pdb
alias pdb="python3 -m pdb"
alias ipdb="python3 -m ipdb"

# du
alias du="du -h"

#Забавы ради
figlet Termux 

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle gitantigen bundle agkozak/zsh-z

antigen bundle heroku
antigen bundle pip
antigen bundle poetry
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster

antigen apply If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/bin:/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/games:~/.local/bin
export PATH=${PATH}:$(find ~/bin -type d | tr '\n' ':' | sed 's/:$//')
# General
set -o vi 

bindkey -v
bindkey '^R' history-incremental-search-backward

# Fun
figlet "Linux is POWER" | lolcat

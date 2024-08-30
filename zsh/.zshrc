source ~/.antigen.zsh

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
export PATH=~/bin:/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/games:~/.local/bin:~/.cargo/bin
export PATH=${PATH}:$(find ~/.bin -type d | tr '\n' ':' | sed 's/:$//')

export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
# General
set -o vi 

bindkey -v
bindkey '^R' history-incremental-search-backward

# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"

#alias lvim='nvim -u ~/.config/lvim/init.lua'
alias lvim="NVIM_APPNAME=lazyvim nvim"

# Fun
figlet "I use Arch btw" | lolcat

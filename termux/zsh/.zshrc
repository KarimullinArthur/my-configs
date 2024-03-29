source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle gitantigen bundle agkozak/zsh-z

antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle postgres
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster

antigen apply If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=~/bin:/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/games
# General
set -o vi 

# Fun
figlet "Termux"

# Other
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
          fi
        }

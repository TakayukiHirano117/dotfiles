alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias vi="nvim"
alias vim="nvim"
alias nvim="nvim"
alias pest="./vendor/bin/pest"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
. "$(brew --prefix asdf)/libexec/asdf.sh"

alias pest="/usr/local/opt/php@8.2/bin/php ./vendor/bin/pest"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

setopt no_beep
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history
bindkey -v
autoload -U compinit 
compinit

if status is-interactive
    # Commands to run in interactive sessions can go here
end



function fish_user_key_bindings
    #bind \cr peco_select_history
 
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
    if test "$__fish_active_key_bindings" = fish_vi_key_bindings
        bind -M insert -m default jk force-repaint
    end
end
# --- alias 定義 ---
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /usr/local/bin $PATH
alias sail='sh (test -f sail; and echo sail; or echo vendor/bin/sail)'
# alias vi='nvim'
# alias vim='nvim'
# alias nvim='nvim'
alias pest='/usr/local/opt/php@8.2/bin/php ./vendor/bin/pest'
function vi
    nvim $argv
end

function vim
    nvim $argv
end

function nvim
    command nvim $argv
end
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.rbenv/bin $PATH

status --is-interactive; and rbenv init - | source

# source (brew --prefix asdf)/libexec/asdf.sh

# set -x NVM_DIR "$HOME/.nvm"
# if test -s /opt/homebrew/opt/nvm/nvm.sh
# source /opt/homebrew/opt/nvm/nvm.sh
# end
# if test -s /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
#   source /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
# end

#set -U fish_greeting ""  # 起動時のメッセージを無効化（Zshのno_beep代替として）

# fish_vi_key_bindings

rbenv init - fish | source

alias gco='git checkout'
alias gst='git status'
alias gcm='git commit -m' # -m オプションを付けておくと便利
alias gpl='git pull'
alias gps='git push'

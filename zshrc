export ZSH=~/.oh-my-zsh

ZSH_THEME="minimal"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

source $ZSH/oh-my-zsh.sh
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias bat="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | ag --nocolor (state|percentage)"
# (git) Open all modified files in vim (separate tab for each)
#alias gvm="vim -p $(git status -s -z | tr ' M ' ' ')"

alias lt="tree --dirsfirst -L 1"

export NVM_DIR="/home/maxi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

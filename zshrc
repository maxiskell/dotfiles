export ZSH=~/.oh-my-zsh

ZSH_THEME="minimal"
COMPLETION_WAITING_DOTS="true"

plugins=(git emoji)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.config/composer/vendor/bin:$PATH"

source $ZSH/oh-my-zsh.sh
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias bat="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | ag --nocolor (state|percentage)"
# (git) Open all modified files in vim (separate tab for each) (permission dennied error...)
#alias gvm="vi -p $(git status --porcelain | sed s/^...//)"

alias lt="tree --dirsfirst -L 1"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

JAVA_HOME=/usr/local/java/jdk1.8.0_144
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME
export PATH

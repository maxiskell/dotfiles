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
alias dbd="psql -h 127.0.0.1 -p 5432 -U octopus -W octopus"
alias phocker="docker exec -ti octopus_php_1 /bin/bash"

# AWS ssh connections
alias bastion-prd="ssh octopusadm@54.213.101.213 -i ~/pems/octopusadm -L 5433:prd-db.cwelybhvq5eq.us-west-2.rds.amazonaws.com:5432"
alias bastion-qa="ssh octopusadm@54.213.101.213 -i ~/pems/octopusadm -L 5433:qa-db.cwelybhvq5eq.us-west-2.rds.amazonaws.com:5432"
alias bastion="ssh octopusadm@54.213.101.213 -i ~/pems/octopusadm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

JAVA_HOME=/usr/local/java/jdk1.8.0_144
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME
export PATH

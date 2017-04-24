export ZSH=/home/maxi/.oh-my-zsh

ZSH_THEME="minimal"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/home/maxi/.local/bin:/home/maxi/.config/composer/vendor/bin:$PATH"

source $ZSH/oh-my-zsh.sh
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias dbd="mysql -usmarttly -psmarttly smarttly"
alias dbs="mysql -usmarttly -psmarttly -hstage.smarttly.com -P3309 smarttly -A"
alias dbfi="mysql -uroot -proot fi"
alias migrate="flyway clean && flyway migrate"
alias erlogs="vi ~/dev/backend/storage/logs/laravel.log"
alias dbdummy="cat ~/dockerdev/database/data-dummy-full/* | mysql -h127.0.0.1 -P3309 -usmarttly -psmarttly smarttly"
alias bat="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | ag --nocolor (state|percentage)"
# (git) Open all modified files in vim (separate tab for each)
#alias gvm="vim -p $(git status -s -z | tr ' M ' ' ')"

alias lt="tree --dirsfirst -L 1"

export NVM_DIR="/home/maxi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

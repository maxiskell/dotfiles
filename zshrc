export ZSH=~/.oh-my-zsh

ZSH_THEME="minimal"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.config/composer/vendor/bin:$PATH"

source $ZSH/oh-my-zsh.sh
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias bat="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | ag --nocolor (state|percentage)"
# (git) Open all modified files in vim (separate tab for each) (permission dennied error...)
alias gvm="git status --porcelain | sed -ne 's/^ M //p' | tr '\n' '\0' | tr -d '\"' | xargs -0 vim -p"

alias lt="tree --dirsfirst -L 1"

alias ussfdb='docker exec -ti mongodb bash -c "mongo"'

alias ussfcompi='docker exec -it ussf-php-fpm bash -c "composer install"'
alias ussfmigref='docker exec -it ussf-php-fpm bash -c "php artisan migrate:refresh"'
alias ussfseed='docker exec -it ussf-php-fpm bash -c "php artisan db:seed"'
alias ussftest='docker exec -it ussf-php-fpm bash -c "composer test"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

POLARIS_INSTALL_BIN="/home/maxi/dev/polaris/polaris-install/bin"
PATH=$PATH:$POLARIS_INSTALL_BIN
export POLARIS_INSTALL_BIN
export PATH

JAVA_HOME=/usr/local/java/jdk1.8.0_144
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME
export PATH

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

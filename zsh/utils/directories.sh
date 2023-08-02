#
# Directories utility aliases, functions and configurations.
# See: https://github.com/ohmyzsh/ohmyzsh/blob/fe4b5659863c388786986d70fa6d1bb66b00afb6/lib/directories.zsh
#

# Changing/making/removing directory
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias lt="tree -L 1"
alias lta="tree -a -L 1"

# fzf + cd
fd () {
  cd $(find * -type d | fzf)
}

# md + cd
mkcd () {
  md -- "$1" && cd -P -- "$1"
}

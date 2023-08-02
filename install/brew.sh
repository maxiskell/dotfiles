#!/bin/bash

if test ! $(which brew); then
    echo "\nInstalling homebrew...\n"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "\nInstalling homebrew packages"
echo "================================\n"

brew install asdf
brew install cloc
brew install deno
brew install diff-so-fancy
brew install direnv
brew install fzf
brew install git
brew install htop
brew install httpie
brew install jq
brew install neovim
brew install node
brew install prettierd
brew install ripgrep
brew install skhd
brew install starship
brew install tmux
brew install trash
brew install tree
brew install tree-sitter
brew install wget
brew install yabai
brew install zoxide
brew install font-sf-mono-nerd-font

echo "\nDone!\n"

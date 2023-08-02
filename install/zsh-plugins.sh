#!/bin/sh

echo "\nInstalling zsh plugins"
echo "======================\n"

if [ ! -d $ZSH_PLUGINS ]; then
  echo "$ZSH_PLUGINS directory not found. Creating.\n"
  mkdir $ZSH_PLUGINS
fi

if [ ! -d $ZSH_PLUGINS/zsh-autocomplete ]; then
  git clone --depth 1 \
    https://github.com/marlonrichert/zsh-autocomplete \
    $ZSH_PLUGINS/zsh-autocomplete
fi

if [ ! -d $ZSH_PLUGINS/zsh-autosuggestions ]; then
  git clone --depth 1 \
    https://github.com/zsh-users/zsh-autosuggestions \
    $ZSH_PLUGINS/zsh-autosuggestions
fi

if [ ! -d $ZSH_PLUGINS/zsh-syntax-highlighting ]; then
  git clone --depth 1 \
    https://github.com/zsh-users/zsh-syntax-highlighting \
    $ZSH_PLUGINS/zsh-syntax-highlighting
fi

if [ ! -d $ZSH_PLUGINS/zsh-history-substring-search ]; then
  git clone --depth 1 \
    https://github.com/zsh-users/zsh-history-substring-search \
    $ZSH_PLUGINS/zsh-history-substring-search
fi

if [ ! -d $ZSH_PLUGINS/zsh-you-should-use ]; then
  git clone --depth 1 \
    https://github.com/MichaelAquilina/zsh-you-should-use \
    $ZSH_PLUGINS/zsh-you-should-use
fi

echo "\nDone!\n"

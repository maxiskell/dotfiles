#!/bin/bash

echo "\nCreating symlinks for ~./config directories"
echo "===========================================\n"

if [ ! -d $HOME/.config ]; then
    echo "~./config not found. Creating it."
    mkdir -p $HOME/.config
fi

if [[ "$(pwd)" == *"install"* ]]; then
  config_dirs=$(find "$(pwd)/.." -type d -mindepth 1 -maxdepth 1 ! -path "*/.git" ! -path "*/install" ! -path "*/claude" | sed 's+/install/..++g')
else
  config_dirs=$(find "$(pwd)" -type d -mindepth 1 -maxdepth 1 ! -path "*/.git" ! -path "*/install" ! -path "*/claude" | sed 's+/install/..++g')
fi

if [ -z "$config_dirs" ]; then
  echo "No directories found.\n"
  exit 0
fi

for config_dir in $config_dirs; do
  target=$HOME/.config/$(basename $config_dir)

  if [ -e $target ]; then
    echo "Symlink for $(basename $config_dir) already exists. Skipping."
  else
    echo "Creating symlink for $(basename $config_dir)"
    ln -s $config_dir $target
  fi
done

echo "\nDone!\n"

echo "\nCreating symlink for ~/.zshrc"
echo "=============================\n"

if [ -e $HOME/.zshrc ]; then
  echo "$HOME/.zshrc found. Renaming to ~/.zshrc.old"
  mv $HOME/.zshrc $HOME/.zshrc.old
fi

if [[ "$(pwd)" == *"install"* ]]; then
  ln -s "$(pwd)/../zsh/zshrc" $HOME/.zshrc
else
  ln -s "$(pwd)/zsh/zshrc" $HOME/.zshrc
fi

echo "\nDone!\n"

echo "\nCreating symlinks for ~/.claude files"
echo "======================================\n"

if [[ "$(pwd)" == *"install"* ]]; then
  claude_dir="$(pwd)/../claude"
else
  claude_dir="$(pwd)/claude"
fi

if [ ! -d $HOME/.claude ]; then
  echo "~/.claude not found. Creating it."
  mkdir -p $HOME/.claude
fi

for rel_file in "CLAUDE.md" "settings.json" "themes/rose-pine-dawn.json"; do
  target="$HOME/.claude/$rel_file"
  mkdir -p "$(dirname $target)"

  if [ -L $target ]; then
    echo "Symlink for ~/.claude/$rel_file already exists. Skipping."
  elif [ -e $target ]; then
    echo "$target found. Renaming to $target.old"
    mv $target $target.old
    ln -s "$claude_dir/$rel_file" $target
  else
    echo "Creating symlink for ~/.claude/$rel_file"
    ln -s "$claude_dir/$rel_file" $target
  fi
done

echo "\nDone!\n"

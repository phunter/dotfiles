#!/usr/bin/env bash

dir=~/dotfiles
olddir=~/dotfiles_old
files=".gitconfig .zshrc .tmux.conf"

cd $dir

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for file in $files; do
        echo "$dir/$file --> ~/$file"
	rm -f ~/$file
        ln -s $dir/$file ~/$file
    done
fi

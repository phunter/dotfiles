#!/usr/bin/env bash

dir=~/dotfiles
olddir=~/dotfiles_old
files=".gitconfig .zshrc .tmux.conf"

cd $dir

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    for file in $files; do
	rm -f ~/$file
        ln -s $dir/$file ~/
    done
fi

rm -f ~/.oh-my-zsh/themes/phuntimes.zsh-theme
ln -s $dir/phuntimes.zsh-theme ~/.oh-my-zsh/themes/

#!/usr/bin/env bash

dir=~/dotfiles

cd $dir

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo ""

# stuff directly in the homedir
if [[ $REPLY != 'y' ]]; then
    echo "quitting!"
    exit
fi

home_files=".gitconfig .zshrc .tmux.conf"
for file in $home_files; do
    rm -f ~/$file
    ln -s $dir/$file ~/
    echo $file
done

rm -f ~/.oh-my-zsh/themes/phuntimes.zsh-theme
ln -s $dir/phuntimes.zsh-theme ~/.oh-my-zsh/themes/

virtualenv_files="postactivate postdeactivate"
for file in $virtualenv_files; do
    rm -f $WORKON_HOME/$file
    ln -s $dir/virtualenv/$file $WORKON_HOME/$file
    echo $file
done


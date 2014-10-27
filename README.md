# phunter dotfiles

## prerequisites

You will need to install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh):

```git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh```

as well as [virtualenv](http://virtualenv.readthedocs.org/en/latest/) and 
[virtualenvwrapper](http://virtualenvwrapper.readthedocs.org/en/latest/):

```sh
sudo pip install virtualenv virtualenvwrapper
export WORKON_HOME=~/virtualenvs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
```

## install

Run this:

```sh
git clone https://github.com/phunter/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

Set up [Vundle](https://github.com/gmarik/Vundle.vim) for managing
vim plugins:
```sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
The first time you run vim you will have to install the plugins with:
```sh
:PluginInstall
```

Use zshell:
```sh
zsh
```

or set it as the default:

```sh
chsh -s $(which zsh)
```

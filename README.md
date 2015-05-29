# phunter dotfiles

## prerequisites

You will need to install:
* [antigen](https://github.com/zsh-users/antigen)
* [vundle](https://github.com/gmarik/Vundle.vim)
* [powerline](https://github.com/Lokaltog/powerline)
* [virtualenv](http://virtualenv.readthedocs.org/en/latest/)
* [virtualenvwrapper](http://virtualenvwrapper.readthedocs.org/en/latest/)
* [fzf](https://github.com/junegunn/fzf)
```sh
git clone https://github.com/zsh-users/antigen.git ~/antigen
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo pip install powerline-status
sudo pip install virtualenv virtualenvwrapper
export WORKON_HOME=~/virtualenvs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
git clone https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install
```

## install
```sh
git clone https://github.com/phunter/dotfiles.git ~/dotfiles
$HOME/dotfiles/setup.sh
```

The first time you run zsh, antigen will clone and install plugins. Start zsh with:
```sh
zsh
```

or set it as the default:
```sh
chsh -s $(which zsh)
```

The first time you run vim you will have to install the plugins with:
```sh
:PluginInstall
```


#!/usr/bin/env python
import os

print('yo')

symlinkables = {
    ".gitconfig": "~/",
    ".zshrc": "~/",
    ".tmux.conf": "~/",
    ".vimrc": "~/",
    "virtualenv/postactivate": "$WORKON_HOME/",
    "virtualenv/postdeactivate": "$WORKON_HOME/",

    # todo: copy instead of symlink
    "custom-capslock.json": "~/.config/karabiner/assets/complex_modifications/",
}

for source, dest in symlinkables.items():
    # os.symlink(src, dst)
    print("linking:  {}  -->  {}".format(source, dest))

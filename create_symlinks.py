#!/usr/bin/env python
import os

print('yo')

subl_home = "/Users/hunter/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"

symlinkables = {
    ".agignore ": "~/",
    ".gitconfig": "~/",
    ".zshrc": "~/",
    ".tmux.conf": "~/",
    ".vimrc": "~/",
    "virtualenv/postactivate": "$WORKON_HOME/",
    "virtualenv/postdeactivate": "$WORKON_HOME/",

    # sublime stuff
    "sublime/Default\ \(OSX\).sublime-keymap": subl_home,
    "sublime/Preferences.sublime-settings": subl_home,
    "sublime/Package\ Control.sublime-settings": subl_home,

    # date-pasting shortcut
    "Type\ the\ Date.workflow": "/Users/hunter/Library/Services",

    # todo: copy instead of symlink
    "custom-capslock.json": "~/.config/karabiner/assets/complex_modifications/",
}

# ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

for source, dest in symlinkables.items():
    # os.symlink(src, dst)
    print("linking:  {}  -->  {}".format(source, dest))

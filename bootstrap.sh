#!/usr/bin/env bash

# Creation of symlink will fail if ~/bin already exists.
# So you'll need to do a `rm -rf ~/bin`

ln -s ~/Projects/dotfiles ~/bin
echo 'source ~/Projects/dotfiles/dotfiles/bashrc' >> ~/.bash_profile
echo 'source ~/Projects/dotfiles/dotfiles/zshrc' >> ~/.zshrc

#!/bin/bash
DOTFILES=$HOME/git/dotfiles

# vim
cp -R $HOME/.vim/* $DOTFILES/.vim/

ls -la $HOME/.vim/bundle >> .vim.bundle
cat $HOME/.config/coc/extensions/package.json >> .coc.extensions

# dotfiles
cp $HOME/.bash_profile $DOTFILES
cp $HOME/.bashrc $DOTFILES
cp $HOME/.vimrc $DOTFILES
cp $HOME/.gitconfig $DOTFILES
cp $HOME/.alacritty.yml $DOTFILES
cp $HOME/.config/kitty/* $DOTFILES/.kitty/

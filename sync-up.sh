#!/bin/bash
DOTFILES=$HOME/git/dotfiles

# vim
cp -R $HOME/.vim/* $DOTFILES/.vim/

ls -la $HOME/.vim/bundle >> vim-bundle.log

# dotfiles
cp $HOME/.bash_profile $DOTFILES
cp $HOME/.bashrc $DOTFILES
cp $HOME/.vimrc $DOTFILES
cp $HOME/.gitconfig $DOTFILES

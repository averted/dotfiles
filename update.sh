#!/bin/bash
DOTFILES=$HOME/git/dotfiles

# vim
cp -R $HOME/.vim/* $DOTFILES/.vim/

# dotfiles
cp $HOME/.bash_profile $DOTFILES
cp $HOME/.bashrc $DOTFILES
cp $HOME/.vimrc $DOTFILES
cp $HOME/.gitconfig $DOTFILES

#!/bin/bash
VIM_DIR=$HOME/.vim
DOTFILES=$HOME/git/dotfiles

# vim
cp $DOTFILES/.vim/themes/* $VIM_DIR/autoload/airline/themes
cp $DOTFILES/.vimrc $HOME

# dotfiles
cp $DOTFILES/.bash_profile $HOME
cp $DOTFILES/.bashrc $HOME
cp $DOTFILES/.gitconfig $HOME

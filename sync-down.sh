#!/bin/bash
VIM_DIR=$HOME/.vim
DOTFILES=$HOME/git/dotfiles

# vim
cp $DOTFILES/.vimrc $HOME

# vim autoload
mkdir -p $VIM_DIR/autoload
cp -R $DOTFILES/.vim/autoload/* $VIM_DIR/autoload

mkdir -p $VIM_DIR/colors
cp -R $DOTFILES/.vim/colors/* $VIM_DIR/colors

mkdir -p $VIM_DIR/dictionaries
cp -R $DOTFILES/.vim/dictionaries/* $VIM_DIR/dictionaries

mkdir -p $VIM_DIR/plugin
cp -R $DOTFILES/.vim/plugin/* $VIM_DIR/plugin

# dotfiles
cp $DOTFILES/.bash_profile $HOME
cp $DOTFILES/.bashrc $HOME
cp $DOTFILES/.gitconfig $HOME

# .config
cp -R $DOTFILES/.config/zed $HOME/.config
cp -R $DOTFILES/.config/ghostty $HOME/.config
cp -R $DOTFILES/.config/wezterm $HOME/.config
cp -R $DOTFILES/.config/powerline $HOME/.config

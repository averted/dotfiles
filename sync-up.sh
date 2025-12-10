#!/bin/bash
DOTFILES=$HOME/git/dotfiles

# vim
cp -R $HOME/.vim/* $DOTFILES/.vim/
cp $HOME/.vimrc $DOTFILES

# dotfiles
cp $HOME/.zshrc $DOTFILES
cp $HOME/.gitconfig $DOTFILES

# .config
cp -R $HOME/.config/zed $DOTFILES/.config
cp -R $HOME/.config/ghostty $DOTFILES/.config

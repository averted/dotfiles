#!/bin/bash
DOTFILES=$HOME/git/dotfiles

# vim
cp -R $HOME/.vim/* $DOTFILES/.vim/

# dotfiles
cp $HOME/.bash_profile $DOTFILES
cp $HOME/.bashrc $DOTFILES
cp $HOME/.vimrc $DOTFILES
cp $HOME/.gitconfig $DOTFILES

# .config
cp -R $HOME/.config/zed $DOTFILES/.config
cp -R $HOME/.config/ghostty $DOTFILES/.config
cp -R $HOME/.config/wezterm $DOTFILES/.config
cp -R $HOME/.config/powerline $DOTFILES/.config

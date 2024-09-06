#!/bin/bash
DOTFILES=$HOME/git/dotfiles

# vim
cp -R $HOME/.vim/* $DOTFILES/.vim/

rm $DOTFILES/.vim.bundle
ls -la $HOME/.vim/bundle >> $DOTFILES/.vim.bundle

# dotfiles
cp $HOME/.bash_profile $DOTFILES
cp $HOME/.bashrc $DOTFILES
cp $HOME/.vimrc $DOTFILES
cp $HOME/.gitconfig $DOTFILES
cp $HOME/.alacritty.yml $DOTFILES

# .config
cp -R $HOME/.config/wezterm $DOTFILES/.config
cp -R $HOME/.config/coc $DOTFILES/.config
cp -R $HOME/.config/zed $DOTFILES/.config

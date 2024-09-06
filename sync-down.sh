#!/bin/bash
VIM_DIR=$HOME/.vim
DOTFILES=$HOME/git/dotfiles

# vim
cp $DOTFILES/.vimrc $HOME
cp $DOTFILES/.vim/themes/* $VIM_DIR/autoload/airline/themes

# vim bundle
cp -R $DOTFILES/.vim/bundle/auto-pairs $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/coc.nvim $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/ctrlp.vim $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/rust.vim $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/vim-airline $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/vim-bufferline $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/vim-javascript $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/vim-json $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/vim-rooter $VIM_DIR/bundle
cp -R $DOTFILES/.vim/bundle/nerdtree $VIM_DIR/bundle

# dotfiles
cp $DOTFILES/.bash_profile $HOME
cp $DOTFILES/.bashrc $HOME
cp $DOTFILES/.gitconfig $HOME

# .config
cp -R $DOTFILES/.config/wezterm $HOME/.config
cp -R $DOTFILES/.config/coc $HOME/.config
cp -R $DOTFILES/.config/zed $HOME/.config

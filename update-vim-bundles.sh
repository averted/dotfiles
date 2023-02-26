#!/bin/bash
VIM_DIR=$HOME/.vim
BUNDLE_DIR=$HOME/.vim/bundle

# rust.vim
rm -rf $BUNDLE_DIR/rust.vim
git clone --depth=1 https://github.com/rust-lang/rust.vim.git $BUNDLE_DIR/rust.vim

# auto-pairs
rm -rf $BUNDLE_DIR/auto-pairs
git clone https://github.com/jiangmiao/auto-pairs $BUNDLE_DIR/auto-pairs

# NERDtree
rm -rf $BUNDLE_DIR/nerdtree
git clone https://github.com/preservim/nerdtree $BUNDLE_DIR/nerdtree

# vim-airline
rm -rf $BUNDLE_DIR/vim-airline
git clone https://github.com/vim-airline/vim-airline $BUNDLE_DIR/vim-airline

# vim-bufferline
rm -rf $BUNDLE_DIR/vim-bufferline
git clone https://github.com/bling/vim-bufferline $BUNDLE_DIR/vim-bufferline

# vim-javascript
rm -rf $BUNDLE_DIR/vim-javascript
git clone https://github.com/averted/vim-javascript $BUNDLE_DIR/vim-javascript

# vim-json
rm -rf $BUNDLE_DIR/vim-json
git clone https://github.com/elzr/vim-json $BUNDLE_DIR/vim-json

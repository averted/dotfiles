#!/bin/bash
VIM_DIR=$HOME/.vim
BUNDLE_DIR=$HOME/.vim/bundle

# auto-pairs
rm -rf $BUNDLE_DIR/auto-pairs
git clone https://github.com/jiangmiao/auto-pairs $BUNDLE_DIR

# coc.nvim
rm -rf $BUNDLE_DIR/coc.nvim
git clone -b release https://github.com/neoclide/coc.nvim $BUNDLE_DIR

# ctrlp
rm -rf $BUNDLE_DIR/vim-ctrlp
rm -rf $BUNDLE_DIR/ctrlp.vim
git clone https://github.com/kien/ctrlp.vim.git $BUNDLE_DIR

# rust.vim
rm -rf $BUNDLE_DIR/rust.vim
git clone --depth=1 https://github.com/rust-lang/rust.vim.git $BUNDLE_DIR

# vim-airline
rm -rf $BUNDLE_DIR/vim-airline
git clone https://github.com/vim-airline/vim-airline $BUNDLE_DIR

# vim-bufferline
rm -rf $BUNDLE_DIR/vim-bufferline
git clone https://github.com/bling/vim-bufferline $BUNDLE_DIR

# vim-javascript
rm -rf $BUNDLE_DIR/vim-javascript
git clone https://github.com/averted/vim-javascript $BUNDLE_DIR

# vim-json
rm -rf $BUNDLE_DIR/vim-json
git clone https://github.com/elzr/vim-json $BUNDLE_DIR

# vim-rooter
rm -rf $BUNDLE_DIR/vim-rooter
git clone https://github.com/airblade/vim-rooter.git $BUNDLE_DIR

# NERDtree
rm -rf $BUNDLE_DIR/nerdtree
git clone https://github.com/preservim/nerdtree $BUNDLE_DIR

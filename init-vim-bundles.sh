#!/bin/bash
VIM_DIR=$HOME/.vim
BUNDLE_DIR=$HOME/.vim/bundle

mkdir -p $BUNDLE_DIR
cd $BUNDLE_DIR

# auto-pairs
rm -rf $BUNDLE_DIR/auto-pairs
git clone https://github.com/jiangmiao/auto-pairs

# ctrlp
rm -rf $BUNDLE_DIR/vim-ctrlp
rm -rf $BUNDLE_DIR/ctrlp.vim
git clone https://github.com/kien/ctrlp.vim.git

# vim-airline
rm -rf $BUNDLE_DIR/vim-airline
git clone https://github.com/vim-airline/vim-airline

# vim-bufferline
rm -rf $BUNDLE_DIR/vim-bufferline
git clone https://github.com/bling/vim-bufferline

# vim-javascript
rm -rf $BUNDLE_DIR/vim-javascript
git clone https://github.com/averted/vim-javascript

# vim-json
rm -rf $BUNDLE_DIR/vim-json
git clone https://github.com/elzr/vim-json

# vim-rooter
rm -rf $BUNDLE_DIR/vim-rooter
git clone https://github.com/airblade/vim-rooter.git

# NERDtree
rm -rf $BUNDLE_DIR/nerdtree
git clone https://github.com/preservim/nerdtree

# minimap
rm -rf $BUNDLE_DIR/minimap.vim
git clone https://github.com/wfxr/minimap.vim
cargo install --locked code-minimap

# rust.vim
# rm -rf $BUNDLE_DIR/rust.vim
# git clone https://github.com/averted/rust.vim.git
# cd $BUNDLE_DIR/rust.vim
# git checkout active
# git pull
# cd -
# rustup component add rust-src

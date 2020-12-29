#!/bin/sh
# install dotfile requirements -> won't copy files!

# install used packages (nvm recommended!)
sudo pacman -S i3 vim zsh tmux termite nodejs
gem install solargraph
# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vim plugins
vim -c 'PluginInstall|q'

# install coc plugins
vim -c 'CocInstall -sync coc-json coc-angular coc-eslint coc-html coc-tsserver coc-solargraph coc-clangd coc-go coc-html coc-markdownlint coc-pyright coc-rust-analyzer coc-sql coc-texlab coc-yaml coc-sh|q'

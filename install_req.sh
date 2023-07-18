#!/bin/sh
# install dotfile requirements -> won't copy files!

# install used packages (nvm recommended!)
pacman -S i3 vim zsh tmux rxvt-unicode nodejs
pip3 install neovim --upgrade
yay -S nvim-nightly-bin

# install vundle
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/veelenga/crystal-zsh.git ~/.oh-my-zsh/custom/plugins/crystal


# install lsp language servers
# ruby
gem install solargraph
# python
npm i -g pyright
# bash
npm i -g bash-language-server
# rust
pacman -S rust-analyzer
# C/C++/Obj.C
pacman -S ccls
# typescript/angular
npm i -g @angular/language-server
npm i -g typescript-language-server
# html
npm i -g vscode-html-languageserver-bin
# docker
npm i -g dockerfile-language-server-nodejs
# golang
pacman -S gopls
# java
yay -S java-language-server
# json
npm i -g vscode-json-languageserver
# crystal -> might need a custom PKGBUILD/installation based on your crystal version
yay -S scry-git
#yay -Q scry-git
# latex
pacman -S texlab
# vim
npm i -g vim-language-server
# yaml
npm i -g yaml-language-server

# vscode langservers
yay -S vscode-langservers-extracted

nvim -c "TSInstall bash bibtex c cpp css dockerfile go html java json lua python regex ruby rust scss toml yaml"

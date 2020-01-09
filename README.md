# dotfiles

+ First make sure following packages are installed:
  + zsh
  + vim
  + tmux
  + i3
  + termite
+ Install Plugin Managers
  + Vundle: ``` git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```
  + Oh-my-zsh: ```sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```
+ Install the Plugins:
  + Vim: `:PluginInstall` for Vundler
  + Zsh: 
    + syntax highlighting: ```git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting```
    + auto suggestions: ```git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions```

+ set the default shell to zsh: ```chsh -s /bin/zsh``` 
+ logout and login to see changes
+ no symbol fix: install the `fonts-powerline` and `dejavu` fonts

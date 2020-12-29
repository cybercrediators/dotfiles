# dotfiles

## Installation
+ First make sure following packages are installed:
  + zsh
  + vim
  + tmux
  + i3
  + termite
+ Install Plugin Managers
  + Vim-Plug: should download and install itselft automatically when starting vim
  + Oh-my-zsh: ```sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```
+ Install the Plugins:
  + Vim: `:PlugInstall` for Vim Plug(should start automatically)
  + Zsh:
    + syntax highlighting: ```git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting```
    + auto suggestions: ```git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions```
+ Spotify polybar status:
  + Check out the [polybar-status](https://github.com/Jvanrhijn/polybar-spotify)

## Troubleshooting
+ set the default shell to zsh: ```chsh -s /bin/zsh``` 
+ logout and login to see changes
+ no symbol fix: install the `fonts-powerline` and `dejavu` fonts
+ fix empty bottom line in termite: adjust the `height` in the polybar config and add `padding: 0px;` to the `~/.config/gtk-3.0/gtk.css` check at which combination the line is invisible
+ For the old youcompleteme: check `vim --version` if you compiled vim with python or not (needs python3!)
+ To use the system-wide clipboard you have to compile your vim with `clipboard` and `xterm_clipboard` (`vim --version | grep clipboard`)
  + easy fix: install gvim, which is (usually) compiled with it out of the box and contains an alias for the 'normal `vim`'

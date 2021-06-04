# dotfiles

## Installation
+ First make sure following packages are installed:
  + zsh
  + vim
  + tmux
  + i3
  + alacritty
  + neovim (nightly/0.5)
+ Install Plugin Managers
  + Vim-Plug: should download and install itself automatically when starting vim
  + Oh-my-zsh: `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"` / Use `./install_req.sh`
+ Install the Plugins:
  + Vim: `:PlugInstall` for Vim Plug(should start automatically)
  + use `./install_req.sh` to install the language servers/zsh plugins
  + Install the following treesitter plugins (`:TSInstall`): / Use `./install_req.sh`
    + bash
    + bibtex
    + c
    + cpp
    + css
    + dockerfile
    + go
    + html
    + java
    + json
    + lua
    + python
    + regex
    + ruby
    + rust
    + scss
    + toml
    + yaml
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
+ no symbols in alacritty:
  + the font is loaded from `~/.fonts`, but the standard installation will not link it
  + clone the powerline fonts: `https://github.com/powerline/fonts`
  + `./install.sh`
  + `ln -s ~/.local/share/fonts ~/.fonts`
  + `xrdb ~/.Xdefaults`
  + check that you have the correct `locales` (e.g. `en_US.utf8`)

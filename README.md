# neovim-setup

## Install neovim
```
brew install neovim
```

## Install vimplug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Create neovim folder in `~/.config/nvim`
Copy all files & dir in this repo to `~/.config/nvim`

## Install plugins
```
nvim +PlugInstall
```

# keymap motion
gd : Go to definition

gi : Go to implementation

ctrl-o : Go back previous open file

ctrl-p : Open fzf search window

ctrl-u : Scroll page up

ctrl-d : Scroll page down

,ae : switch to test file

,-tab : switch between previous file

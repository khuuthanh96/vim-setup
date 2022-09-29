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

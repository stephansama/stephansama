# [ZSH](https://en.wikipedia.org/wiki/Z_shell)

## [Oh My ZSH](https://ohmyz.sh/#install)

### Install OMZ

#### Install OMZ Unix

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Install OMZ Windows

```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

### Favourite [OMZ Plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview)

#### Built in OMZ Plugins

- [battery](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/battery)
- [aliases](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases)
- [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
- [sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo)
- [tmux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux)
- [nvm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm)
- [yarn](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn)
- [rust](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust)
- [golang](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/golang)
- [macos](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos)
- [archlinux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux)
- [systemd](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd)

#### Need to download OMZ Plugins

- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

- [pnpm](https://github.com/ntnyq/omz-plugin-pnpm)

```sh
git clone --depth=1 https://github.com/ntnyq/omz-plugin-pnpm.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/pnpm
```

- [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)

```sh
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom/}/plugins/zsh-vi-mode
```

- [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)

```sh
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
```

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- [zsh-syntax-highlighting](https://github.com/marlonrichert/zsh-syntax-highlighting)
- [Catppuccin zsh-syntax-highlighting](https://github.com/catppuccin/zsh-syntax-highlighting)

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

```sh
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/zsh-syntax-highlighting/
```

## TMUX

### Install TMUX

#### Install TMUX Linux

```sh
sudo pacman -S tmux
```

#### Install TMUX MacOS

```sh
brew install tmux
```

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Favourite [TMUX Plugins](https://github.com/tmux-plugins/tpm)

### Additional TMUX Keybindings

| Keybinding | Description                                                      |
|------------|------------------------------------------------------------------|
| `<C-b>`    | Prefix or (`P`)                                                  |
| `<C-h>`    | Move to left                                                     |
| `<C-j>`    | Move to down                                                     |
| `<C-k>`    | Move to up                                                       |
| `<C-l>`    | Move to right                                                    |
| `P,[`      | Switch to copy mode                                              |
| `P,I`      | Install tmux plugins                                             |
| `P,S`      | Save tmux continuum session                                      |
| `P,F`      | Fuzzy find for tmux commands                                     |
| `P,s`      | Fuzzy find for tmux sessions                                     |
| `P,w`      | Fuzzy find for tmux windows                                      |
| `P,g`      | Open floating lazygit window                                     |
| `P,o`      | Open under cursor  with default program                          |
| `P,<C-o>`  | Open under cursor  with default `$EDITOR`                        |
| `P,f`      | Find file to open with default `$EDITOR` using `fpp`             |
| `P,<C-f>`  | Search and select file within current buffer                     |
| `P,u`      | Find url within the current buffer and open with default browser |
| `P,<C-u>`  | Search and select url within current buffer                      |

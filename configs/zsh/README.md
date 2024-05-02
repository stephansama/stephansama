# ZSH

## [Oh My ZSH](https://ohmyz.sh/)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Favourite Plugins

#### Built In

- [battery](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/battery)

##### Productivity

- [aliases](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases)
- [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
- [sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo)
- [tmux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux)

##### Programming Languages

- [nvm](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm)
- [yarn](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn)
- [golang](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/golang)
- [rust](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust)

##### MacOS

- [macos](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos)

##### Linux

- [archlinux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux)
- [systemd](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd)

#### Need to download

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

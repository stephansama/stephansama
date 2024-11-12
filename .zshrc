export VISUAL='nvim'
export EDITOR='nvim'

export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.

export ZSH_THEME=""

plugins=(
	git                     # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
	sudo                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
	tmux                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
	aliases                 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases
	vi-mode                 # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
	nvm                     # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm
	yarn                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn
	rust                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust
	golang                  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/golang
	pnpm                    # https://github.com/ntnyq/omz-plugin-pnpm
	zsh-autocomplete        # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autocomplete
	zsh-autosuggestions     # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autosuggestions
	zsh-syntax-highlighting # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/highlighting
)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	plugins+=(
		archlinux # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux
		systemd   # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd
	)
else
	plugins+=(
		macos # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
	)
fi

source $ZSH/oh-my-zsh.sh

alias ls='lsd'
alias nv='nvim'
alias lg='lazygit'
alias ci='cd $(find . -mindepth 1 -maxdepth 1 | fzf)'
alias img='wezterm imgcat'
alias del='rm -rf $(find . -mindepth 1 -maxdepth 1 | fzf)'
alias all='als | awk NF | fzf'
alias restow='stow -D . && stow .'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias CM_LAUNCHER=wofi
	export QT_QPA_PLATFORMTHEME=qt6ct
	# load nvm from AUR
	source /usr/share/nvm/init-nvm.sh
else
	# load nvm from homebrew
	export NVM_DIR="$HOME/.nvm"
	[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
	[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export GOPATH=$HOME/go

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"  # append binaries
export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # append binaries
export PATH="$HOME/Library/Python/3.9/bin:$PATH"   # MacOS Python
export PATH="$HOME/.console-ninja/.bin:$PATH"      # console ninja for vscode
export PATH=$HOME/.cargo/bin/:$PATH                # append rust binaries to path
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin          # append go binaries to path
export PATH="$HOME/.sst/bin:$PATH"                 # sst
export PATH="$PATH:$HOME/.local/bin"               # Created by `pipx` on 2024-08-04 12:48:38

set -o vi

eval "$(starship init zsh)"

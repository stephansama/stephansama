export ZSH="$HOME/.oh-my-zsh"
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
	# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
	plugins+=(
		macos
	)
fi

source "$ZSH/oh-my-zsh.sh"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias CM_LAUNCHER=wofi
	export QT_QPA_PLATFORMTHEME=qt6ct
	source /usr/share/nvm/init-nvm.sh
else
	export NVM_DIR="$HOME/.nvm"
	[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
	[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi

alias v='find . | fzf | xargs -r nvim'
alias c='clear'
alias ls='lsd'
alias nv='nvim'
alias lg='lazygit'
alias img='wezterm imgcat'
alias all='als | awk NF | fzf'
alias ai='oatmeal sessions open'
alias restow='stow -D . && stow .'

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export EDITOR='nvim'
export VISUAL='nvim'

export GOPATH="$HOME/go"
export GOPATH="$HOME/go"

export PATH="$PATH"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.sst/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

set -o vi

eval "$(starship init zsh)"

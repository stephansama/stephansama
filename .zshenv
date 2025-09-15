export EDITOR='nvim'
export VISUAL='nvim'

export FZF_DEFAULT_OPTS='--tmux center --preview-window="down"'

# https://github.com/antfu-collective/ni?tab=readme-ov-file#config
export NI_GLOBAL_AGENT="pnpm"

export BOOKMARKS="$DOTFILES/custom/bookmarks/"
export CODE="$HOME/Code"
export DOTFILES="$HOME/.dotfiles/"
export GOPATH="$HOME/go"
export SCRIPTS="$HOME/.config/scripts/"

export PATH="$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
export PATH="$PATH:$HOME/.sst/bin"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"
export PATH="$PATH:$SCRIPTS"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/sbin"

if ! type nvim &>/dev/null; then
	export MANPAGER="less --incsearch"
else
	export MANPAGER="nvim +Man!"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export EDITOR='nvim'
export VISUAL='nvim'

export FZF_DEFAULT_OPTS='--tmux center'

# https://github.com/antfu-collective/ni?tab=readme-ov-file#config
export NI_GLOBAL_AGENT="pnpm"

export CODE="$HOME/Code"
export SCRIPTS="$HOME/.config/scripts/"
export DOTFILES="$HOME/.dotfiles/"
export BOOKMARKS="$DOTFILES/custom/bookmarks/"

if ! type nvim &>/dev/null; then
	export MANPAGER="less --incsearch"
else
	export MANPAGER="nvim +Man!"
fi

export GOPATH="$HOME/go"

export PATH="$PATH"
export PATH="$PATH:/sbin"
export PATH="$PATH:$SCRIPTS"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.sst/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$HOME/.config/scripts"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

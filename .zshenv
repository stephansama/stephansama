export EDITOR='nvim'
export VISUAL='nvim'
export FZF_DEFAULT_OPTS='--tmux center'

# https://github.com/antfu-collective/ni?tab=readme-ov-file#config
export NI_GLOBAL_AGENT="pnpm"

export CODE="$HOME/Code"

export GOPATH="$HOME/go"
export GOPATH="$HOME/go"

export SCRIPTS="$HOME/.config/scripts/"
export DOTFILES="$HOME/.dotfiles/"
export BOOKMARKS="$DOTFILES/custom/bookmarks/"

export PATH="$PATH"
export PATH="$PATH:/sbin"
export PATH="$PATH:$SCRIPTS"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.sst/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$HOME/.config/scripts"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias CM_LAUNCHER=wofi
	export QT_QPA_PLATFORMTHEME=qt6ct
	source /usr/share/nvm/init-nvm.sh
else
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

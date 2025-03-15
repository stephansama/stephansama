# shellcheck disable=1091
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""

plugins=(
	git                          # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
	sudo                         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
	tmux                         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
	aliases                      # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases
	vi-mode                      # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
	nvm                          # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm
	rust                         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust
	golang                       # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/golang
	pnpm                         # https://github.com/ntnyq/omz-plugin-pnpm
	zsh-autocomplete             # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autocomplete
	zsh-autosuggestions          # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autosuggestions
	zsh-syntax-highlighting      # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/highlighting
	zsh-npm-scripts-autocomplete # https://github.com/grigorii-zander/zsh-npm-scripts-autocomplete
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

# shellcheck disable=1090
source <(fzf --zsh)
source "$ZSH/oh-my-zsh.sh"

function e() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias ai='oatmeal sessions open'
alias fp='. fzf-projects.sh'
alias all='. fzf-alias.sh'
alias lg='launch-lazygit.sh'
alias b='launch-bat.sh'
alias c='clear'
alias ls='lsd'
alias dst="find . -type f -name '.DS_Store' -delete"
alias pj="bat package.json | jq '.scripts'"
alias restow='stow -D . && stow .'
alias lv='NVIM_APPNAME=lazyvim nvim'
alias ov='vim'
alias v='nvim'

source "$HOME/.config/scripts/completion-pnpm.sh"

if ! type docker &>/dev/null; then
	source "$HOME/.config/scripts/completion-docker.sh"
fi

set -o vi

eval "$(starship init zsh)"

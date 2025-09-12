# shellcheck disable=1091
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""

set -o vi

plugins=(
	git                          # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
	sudo                         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
	tmux                         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
	aliases                      # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases
	vi-mode                      # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
	rust                         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust
	golang                       # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/golang
	pnpm                         # https://github.com/ntnyq/omz-plugin-pnpm
	zsh-autocomplete             # https://github.com/marlonrichert/zsh-autocomplete
	zsh-autosuggestions          # https://github.com/zsh-users/zsh-autosuggestions
	zsh-syntax-highlighting      # https://github.com/zsh-users/zsh-syntax-highlighting
	zsh-npm-scripts-autocomplete # https://github.com/grigorii-zander/zsh-npm-scripts-autocomplete
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

source "$ZSH/oh-my-zsh.sh"

function e() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd" || exit
	fi
	rm -f -- "$tmp"
}

alias \
	all='. fzf-alias.sh' \
	b='launch-bat.sh' \
	c='clear' \
	cp='cp -iv' \
	mv='mv -iv' \
	dst="find . -type f -name '.DS_Store' -delete" \
	fp='. fzf-projects.sh' \
	fpj='. fzf-pkgjson.sh' \
	gd='cd $DOTFILES' \
	gdo="find . -type f -name '*.orig' -delete" \
	gsm='. fzf-submodule.sh' \
	gu='. git-toplevel.sh' \
	lg='launch-lazygit.sh' \
	ls='lsd' \
	ov='vim' \
	restow='stow -D . && stow .' \
	tsv='NVIM_APPNAME="tsnvim" nvim' \
	v='nvim'

if type pnpm &>/dev/null; then
	source "$HOME/.config/scripts/completion-pnpm.sh"
fi

if type docker &>/dev/null; then
	source "$HOME/.config/scripts/completion-docker.sh"
fi

if type nvm &>/dev/null; then
	source "$HOME/.config/scripts/autoload-nvm.sh"
fi

if type fzf &>/dev/null; then
	source <(fzf --zsh)
fi

if type atuin &>/dev/null; then
	eval "$(atuin init zsh)"
fi

if type bob &>/dev/null; then
	eval "$(bob complete zsh)"
fi

if type starship &>/dev/null; then
	eval "$(starship init zsh)"
fi

if type fnm &>/dev/null; then
	eval "$(fnm env --use-on-cd --shell zsh)"
fi

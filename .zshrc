source "$HOME/.antidote/antidote.zsh"

antidote load

set -o vi

unalias nr # remove unused alias set by grigorii-zander/zsh-npm-scripts-autocomplete

alias \
	all='. fzf-alias.sh' \
	b='launch-bat.sh' \
	c='clear' \
	cp='cp -iv' \
	dst="find . -type f -name '.DS_Store' -delete" \
	fp='. fzf-projects.sh' \
	fpj='. fzf-pkgjson.sh' \
	gd='cd $DOTFILES' \
	gdo="find . -type f -name '*.orig' -delete" \
	gsm='. fzf-submodule.sh' \
	gsmi='. $DOTFILES/submodule.sh' \
	gu='. git-toplevel.sh' \
	lg='launch-lazygit.sh' \
	ls='lsd' \
	mv='mv -iv' \
	ov='vim' \
	restow='stow -D . && stow .' \
	vc='code .'

# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
if type yazi &>/dev/null; then
	function e() {
		local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
		yazi "$@" --cwd-file="$tmp"
		if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
			builtin cd -- "$cwd" || exit
		fi
		rm -f -- "$tmp"
	}
fi

# wrap calling nvim with any passed arguments then return to last known directory
if type nvim &>/dev/null; then
	v() {
		nvim "$@"
		cd "$(cat ~/.nvim_cwd 2>/dev/null || pwd)"
	}
fi

# https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
if type fzf &>/dev/null; then
	source <(fzf --zsh)
fi

# https://docs.atuin.sh/integrations/
if type atuin &>/dev/null; then
	eval "$(atuin init zsh)"
fi

# https://starship.rs/guide/#step-2-set-up-your-shell-to-use-starship
if type starship &>/dev/null; then
	eval "$(starship init zsh)"
fi

source "$HOME/.config/scripts/completions/setup.sh"

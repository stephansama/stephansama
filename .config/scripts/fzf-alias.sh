#!/bin/zsh

if [[ -z "$CODE" ]]; then
	source "$HOME/.zshrc"
fi

als | awk NF | fzf \
	--ansi \
	--tmux

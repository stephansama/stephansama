#!/bin/zsh

source "$HOME/.zshrc"

als | awk NF | fzf \
	--ansi \
	--tmux

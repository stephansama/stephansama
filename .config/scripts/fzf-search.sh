#!/bin/bash

# Based on this [script](./fzf-bookmarks.sh)

if ! type fzf &>/dev/null; then
	echo "fzf is not installed" >&2
	exit 1
fi

dir="$HOME/.dotfiles/custom/bookmarks/searchbars/"
PREVIEW_WINDOW="up,1"
SEARCH_PROMPT=" Searchbars  "
INPUT_PROMPT="Input query: "

if type explorer.exe &>/dev/null; then
	open_command="explorer.exe"
elif type open &>/dev/null; then
	open_command="open"
elif type xdg-open &>/dev/null; then
	open_command="xdg-open"
fi

selected=$(cat "$dir"/*.txt | fzf \
	--tmux \
	--border=rounded \
	--prompt="$SEARCH_PROMPT" \
	--bind="enter:become(echo {-1})+abort" \
	--with-nth='1..-2' \
	--preview='echo {-1}' \
	--preview-window="$PREVIEW_WINDOW")

if [[ -z "$selected" ]]; then
	exit 1
fi

query=$(echo "" | fzf --tmux \
	--border=rounded \
	--prompt="$INPUT_PROMPT" \
	--preview="echo \"$selected\"" \
	--preview-window="$PREVIEW_WINDOW" \
	--print-query)

if [[ -z "$query" ]]; then
	exit 1
fi

url="${selected//\{query\}/$query}"

$open_command "$url"

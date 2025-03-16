#!/usr/bin/env bash

# Based on this script
# https://github.com/hamvocke/lnks/blob/main/lnks.sh
# modified to work with tmux

set -o pipefail
set -o errexit
set -o nounset

if ! type fzf &>/dev/null; then
	echo "fzf is not installed" >&2
	exit 1
fi

keep_open=false
dir="$HOME/.dotfiles/custom/bookmarks/"
PROMPT=" Search Bookmarks  "

usage() {
	echo "Usage: $(basename "$0") [OPTIONS...]"
	echo "  -k        --keep-open     Keep lnks open after selecting a bookmark"
	echo "  -d <dir>  --dir <dir>     Specify a directory where bookmarks files are stored"
	exit 0
}

while [[ "$#" -gt 0 ]]; do
	case $1 in
	-k | --keep-open) keep_open=true ;;
	-d | --dir)
		dir="$2"
		shift
		;;
	-h | --help) usage ;;
	*)
		echo "Unknown parameter passed: $1" >&2
		exit 1
		;;
	esac
	shift
done

if type explorer.exe &>/dev/null; then
	open_command="explorer.exe"
elif type open &>/dev/null; then
	open_command="open"
elif type xdg-open &>/dev/null; then
	open_command="xdg-open"
fi

if [ "$keep_open" = true ]; then
	command_suffix="+clear-query"
else
	command_suffix="+abort"
fi

enter_command="enter:execute-silent(${open_command} {-1})${command_suffix}"

cat "$dir"/*.txt | fzf \
	--tmux \
	--border=rounded \
	--prompt="$PROMPT" \
	--with-nth='1..-2' \
	--bind="${enter_command}" \
	--preview='echo {-1}' \
	--preview-window='up,1'

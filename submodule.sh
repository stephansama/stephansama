#!/usr/bin/env sh

# If arguments are passed, handle them non-interactively
if [ "$#" -gt 0 ]; then
	if [ "$1" = "uninstall" ]; then
		echo "Deinitializing all submodules..."
		git submodule deinit -f --all
		exit 0
	fi

	for module in "$@"; do
		echo "Installing $module"
		git submodule update --init "$module"
	done
	exit 0
fi

# select a submodule to interact with (lists all available submodules)
module=$(
	git config --file .gitmodules --get-regexp path |
		awk '{print $2}' |
		fzf
)

if [ -z "$module" ]; then
	echo "No module selected"
	exit 1
fi

action=$(printf "init\ndeinit" | fzf)

if [ -z "$action" ]; then
	echo "No action selected"
	exit 1
fi

if [ "$action" = "init" ]; then
	git submodule update --init "$module"
else
	git submodule deinit -f "$module"
fi

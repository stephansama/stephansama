#!/usr/bin/env sh

# select a submodule to interact with
module=$(git submodule --quiet foreach 'echo $path' | fzf)

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

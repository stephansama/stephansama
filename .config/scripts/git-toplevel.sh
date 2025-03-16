#!/bin/bash

current="$(pwd)"

goto_toplevel() {
	cd "$(git rev-parse --show-toplevel)" || exit
}

goto_toplevel

if [[ "$current" == "$(pwd)" ]]; then
	cd .. || exit
	goto_toplevel
fi

#!/bin/bash

if [[ $("$HOME/.config/scripts/theme.sh") == 'Dark' ]]; then
	export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"
else
	export LG_CONFIG_FILE="$HOME/.config/lazygit/latte.yml"
fi

lazygit

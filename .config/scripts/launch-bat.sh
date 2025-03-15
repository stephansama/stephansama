#!/bin/bash

theme=$("$HOME/.config/scripts/theme.sh")
BAT_THEME="Catppuccin "

if [[ $theme == 'Dark' ]]; then
	BAT_THEME+="Mocha"
else
	BAT_THEME+="Latte"
fi

export BAT_THEME

bat "$1"

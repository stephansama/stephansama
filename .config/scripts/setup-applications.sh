#!/bin/bash

base_applications=(
	# Programming
	"go"
	"gcc"
	"nvm"
	"lua"
	"zig"
	"make"
	"rustup"
	# Terminal
	"lsd"
	"vim"
	"tmux"
	"docker"
	"neovim"
	"ranger"
	"lazygit"
	"wezterm"
	"starship"
	"coreutils"
	# Utilities
	"jq"
	"fzf"
	"ncdu"
	"stow"
	"tokei"
	"ollama"
	"yt-dlp"
	"ripgrep"
	# GUI Utilities
	"vlc"
	"gimp"
	"kid3"
	"steam"
	"discord"
	"firefox"
	"google-chrome"
)

#######################################
# Logs application installation to console
# Arguments:
#   success status
#   application name
#   medium
#######################################
log() {
	if [ "$1" == true ]; then
		prefix="Successfully installed "
		method="via"
	else
		prefix="Failed to install "
		method="for"
	fi
	echo "$prefix $2 $method $3"
}

for application in "${base_applications[@]}"; do
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		if pacman -S "$application"; then
			log true "$application" "pacman"
		elif yay -S "$application"; then
			log true "$application" "yay"
		else
			log false "$application" "linux"
		fi
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		if brew install "$application"; then
			log true "$application" "brew"
		elif brew --cask install "$application"; then
			log true "$application" "brew cask"
		else
			log false "$application" "macos"
		fi
	else
		echo "Unsupported OS: $OSTYPE"
		exit 1
	fi
done

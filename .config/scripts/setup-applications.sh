#!/bin/bash

programming_applications=(
	"gcc"
	"go"
	"lua"
	"make"
	"nvm"
	"rustup"
	"zig"
)

terminal_applications=(
	"coreutils"
	"docker"
	"fzf"
	"jq"
	"lazygit"
	"lsd"
	"ncdu"
	"neovim"
	"ollama"
	"ranger"
	"ripgrep"
	"starship"
	"stow"
	"tmux"
	"tokei"
	"vim"
	"wezterm"
	"yt-dlp"
)

gui_applications=(
	"discord"
	"firefox"
	"gimp"
	"google-chrome"
	"kid3"
	"steam"
	"vlc"
)

base_applications=(
	"${programming_applications[@]}"
	"${terminal_applications[@]}"
	"${gui_applications[@]}"
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

#!/bin/bash

declare -A sources=(
	["lazygit"]="$HOME/.config/lazygit/."
	["kitty"]="$HOME/.config/kitty/."
	["tmux"]="$HOME/.tmux.conf"
	["vim"]="$HOME/.vimrc"
	["zsh"]="$HOME/.zshrc"
)

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sources+=(
		["evremap"]="/etc/evremap.toml"
		["refind"]="/boot/EFI/refind/refind.conf"
		["sddm"]="/etc/sddm.conf"
		["hypr"]="$HOME/.config/hypr/."
		["qt"]="$HOME/.config/qt5ct/."
		["wofi"]="$HOME/.config/wofi/."
		["waybar"]="$HOME/.config/waybar/."
		["wlogout"]="$HOME/.config/wlogout/."
	)
fi

for key in "${!sources[@]}"; do
	declare input="${sources[${key}]}"
	declare output="./configs/${key}"

	# if not a directory append input filename as apart of output directory
	if [[ ! -d "${input}" ]]; then
		output+="/$(basename -- "${input}")"
	fi

	sudo cp -r "${input}" "${output}"
done

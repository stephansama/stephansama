#!/bin/bash

# Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# OMZ External plugins
plugins=(
	"pnpm https://github.com/ntnyq/omz-plugin-pnpm.git"
	"zsh-autocomplete https://github.com/marlonrichert/zsh-autocomplete.git"
	"zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git"
	"zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git"
	"zsh-npm-scripts-autocomplete https://github.com/grigorii-zander/zsh-npm-scripts-autocomplete.git"
)

for plugin in "${plugins[@]}"; do
	key="${plugin%% *}"  # Extract key (before the first space)
	value="${plugin#* }" # Extract value (after the first space)
	git clone --depth=1 "$value" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$key"
done

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	package_manager="sudo pacman -S"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	package_manager="brew install"
else
	echo "Unsupported OS: $OSTYPE"
	exit 1
fi

# Install Starship
$package_manager starship

# Install TMUX
$package_manager tmux

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

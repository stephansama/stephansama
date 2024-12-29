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

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

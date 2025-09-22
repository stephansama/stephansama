submodule:
	./submodule.sh

stow:
	stow .

restow:
	stow -D . && stow .

linux:
	./submodule.sh \
		.antidote \
		.config/atuin \
		.config/lazygit \
		.config/mise \
		.config/nvim \
		.config/rofi \
		.config/scripts \
		.config/tmux \
		.config/wezterm \
		.config/yazi \
		custom/refind \
		custom/sddm

macos:
	./submodule.sh \
		.antidote \
		.config/atuin \
		.config/lazygit \
		.config/mise \
		.config/nvim \
		.config/scripts \
		.config/tmux \
		.config/wezterm \
		.config/yazi \
		custom/alfred

clean:
	./submodule.sh uninstall

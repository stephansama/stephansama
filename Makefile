submodule:
	./submodule.sh

linux:
	./submodule.sh \
		.config/atuin \
		.config/mise \
		.config/nvim \
		.config/rofi \
		.config/scripts \
		.config/yazi \
		.config/wezterm \
		.config/lazygit \
		custom/refind \
		custom/sddm

macos:
	./submodule.sh \
		.config/atuin \
		.config/mise \
		.config/nvim \
		.config/scripts \
		.config/yazi \
		.config/wezterm \
		.config/lazygit \
		custom/alfred

clean:
	./submodule.sh uninstall

submodule:
	./submodule.sh

linux:
	./submodule.sh \
		.config/atuin \
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
		.config/nvim \
		.config/scripts \
		.config/yazi \
		.config/wezterm \
		.config/lazygit

clean:
	./submodule.sh uninstall

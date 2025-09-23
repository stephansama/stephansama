submodule:
	~/.config/scripts/git-submodule.sh

stow:
	stow .

restow:
	stow -D . && stow .

base:
	git submodule update --init --recursive .config/tmux \
		custom/zsh
	git submodule update --init .config/atuin \
		.config/lazygit
		.config/mise
		.config/nvim
		.config/scripts
		.config/starship
		.config/wezterm
		.config/yazi

linux: base
	git submodule update --init .config/rofi \
		custom/refind
		custom/sddm

macos: base
	git submodule update --init custom/alfred

clean:
	git submodule deinit -f --all

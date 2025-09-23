submodule:
	~/.config/scripts/git-submodule.sh

stow:
	stow .

restow:
	stow -D . && stow .

base:
	git submodule update --init --recursive .config/tmux
	git submodule update --init --recursive custom/zsh
	git submodule update --init .config/atuin
	git submodule update --init .config/lazygit
	git submodule update --init .config/mise
	git submodule update --init .config/nvim
	git submodule update --init .config/scripts
	git submodule update --init .config/starship
	git submodule update --init .config/wezterm
	git submodule update --init .config/yazi
	make -C custom/zsh stow
	make -C .config/mise install
	make -C .config/nvim all

linux: base
	git submodule update --init .config/rofi
	git submodule update --init custom/refind
	git submodule update --init custom/sddm

macos: base
	git submodule update --init custom/alfred

clean:
	git submodule deinit -f --all

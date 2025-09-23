submodule:
	~/.config/scripts/git-submodule.sh

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
	eval $$(mise activate --shims)
	make -C .config/nvim all

linux: base
	git submodule update --init .config/rofi
	git submodule update --init custom/refind
	git submodule update --init custom/sddm

macos: base
	git submodule update --init custom/alfred

stow:
	stow .

unstow:
	stow -D .

restow: unstow stow

clean: unstow
	git submodule deinit -f --all

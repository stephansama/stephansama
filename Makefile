.PHONY: linux macos restow submodule zsh nvim mise base linux-modules macos-modules stow unstow clean all test

stow:
	stow .

unstow:
	stow -D .

restow: unstow stow

clean: unstow
	git submodule deinit -f --all

submodule:
	~/.config/scripts/git-submodule.sh

zsh:
	git submodule update --init --recursive custom/zsh
	make -C custom/zsh stow

nvim:
	git submodule update --init .config/nvim
	make -C .config/nvim all

mise:
	git submodule update --init .config/mise
	make -C .config/mise activate

base: zsh mise nvim
	git submodule update --init --recursive .config/tmux
	git submodule update --init .config/atuin
	git submodule update --init .config/git
	git submodule update --init .config/lazygit
	git submodule update --init .config/scripts
	git submodule update --init .config/starship
	git submodule update --init .config/wezterm
	git submodule update --init .config/yazi

linux-modules: base
	git submodule update --init .config/rofi
	git submodule update --init custom/refind
	git submodule update --init custom/sddm

macos-modules: base
	git submodule update --init custom/alfred

linux: linux-modules stow

macos: macos-modules stow

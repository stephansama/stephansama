#!/usr/bin/env tsx

import * as utility from '../utility'

export const baseModules = [
	'atuin',
	'gitconfig',
	'lazygit',
	'mise',
	'nvim',
	'scripts',
	'starship',
	'tmux',
	'wezterm',
	'yazi',
	'zsh',
] as const satisfies Array<utility.types.Submodule>

for (const current of baseModules) {
	utility.functions.sh`mise run submodule init ${current}`
}

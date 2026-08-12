#!/usr/bin/env tsx
//MISE depends=["setup:base"]

import * as utility from '../utility'

export const linuxModules = [
	'refind',
	'rofi',
	'sddm',
] as const satisfies Array<utility.types.Submodule>

for (const current of linuxModules) {
	utility.functions.sh`mise run submodule init ${current}`
}

utility.functions.sh`mise run stow -c`

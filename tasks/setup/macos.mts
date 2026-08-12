#!/usr/bin/env tsx
//MISE depends=["setup:base"]

import * as utility from '../utility'

export const macosModules = [
	'alfred'
] as const satisfies Array<utility.types.Submodule>

for (const current of macosModules) {
	utility.functions.sh`mise run submodule init ${current}`
}

utility.functions.sh`mise run stow -c`

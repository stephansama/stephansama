#!/usr/bin/env tsx
//MISE depends=["setup:base"]

import * as utility from '../utility'

utility.functions.setup({
	stow: true,
	modules: [
		'alfred'
	],
})

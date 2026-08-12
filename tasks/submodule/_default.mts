#!/usr/bin/env tsx
//MISE description="setup dotfile submodule"
//USAGE arg "<action>" help="Action to perform" {
//USAGE   choices "init" "deinit" "update"
//USAGE }
//USAGE arg "<module>" help="submodule to init"

import * as cp from 'node:child_process'
import * as fs from 'node:fs'

import * as utility from '../utility'

const { usage_action, usage_module } = process.env;

const ACTIONS = ['init', 'deinit', 'update'] as const
type ACTION = typeof ACTIONS[number]

if (!isValidAction(usage_action)) {
	throw new Error(`unable to perform submodule action received invalid action ${usage_action}`)
}

if (!utility.functions.isSubmodule(usage_module)) {
	throw new Error(`please pass in a valid submodule`)
}

const submodulePath = utility.constants.SubmoduleMetaInformation[usage_module].path

console.log(`performing action: ${usage_action} for submodule ${usage_module} located at ./${submodulePath}`)

switch (usage_action) {
	case "deinit":
		utility.functions.sh`git submodule deinit -f -- "${submodulePath}"`
		break
	case "init":
		utility.functions.sh`git submodule update --init --recursive ${submodulePath}`
		const hasConfig = await hasMiseConfiguration(submodulePath)
		console.log(`${hasConfig ? '✅' : '🚫'} this module does ${!hasConfig ? 'not ' : ''}have a mise.toml configuration`)
		if (!hasConfig) break

		utility.functions.chdir(submodulePath, () => {
			const sh = String.raw
			const tasks = cp.execSync(sh`mise tasks --json`, { 'encoding': 'utf8' })
			const taskJson = JSON.parse(tasks.trim()) as Array<utility.types.MiseTask>

			const hasSetupScript = taskJson.find((current) => current.name === 'setup')
			if (!hasSetupScript) return

			utility.functions.sh`mise run setup`

		})
		break
	case "update":
		utility.functions.sh`git submodule update --remote --recursive -- ${submodulePath}`
		break
}

async function hasMiseConfiguration(directory: string) {
	const list = await fs.promises.readdir(directory)
	return list.includes('mise.toml' as const)
}

function isValidAction(action: unknown): action is ACTION {
	return ACTIONS.includes(action as ACTION)
}

import { SubmoduleMetaInformation } from "./constants";

export type Submodule = keyof typeof SubmoduleMetaInformation

export type MiseTask = {
	name: string
	description: string
	source: string
	config_sources: Array<string>
	aliases: Array<string>
	depends: Array<string>
	depends_post: Array<string>
	wait_for: Array<string>
	env: Array<string>
	dir: string
	hide: boolean
	global: boolean
	raw: boolean
	interactive: boolean
	sources: Array<string>
	outputs: Array<string>
	shell: null
	quiet: boolean
	silent: boolean
	tools: {}
	usage: string
	timeout: null
	run: Array<string>
	args: Array<string>
	file: null
}

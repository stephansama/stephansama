#!/usr/bin/env tsx
//MISE description="generate the constants file from .gitmodules file"

import * as fs from 'node:fs'
import * as url from 'node:url'
import path from 'node:path'

type Module = { name: string; path?: string; url?: string;[key: string]: string | undefined }

const dirname = path.dirname(url.fileURLToPath(import.meta.url))
const outputFile = path.join(dirname, '../utility/constants.ts')
const gitmodulePath = path.join(dirname, '../../.gitmodules')
const gitmoduleFile = await fs.promises.readFile(gitmodulePath, 'utf8')
const modules = parseGitmodulesFile(gitmoduleFile)
const file = generateTemplate(modules)
await fs.promises.writeFile(outputFile, file, 'utf8')

function generateTemplate(modules: Module[]) {
	const ts = String.raw
	const template = ts`
export const SubmoduleMetaInformation = { // metainformation
} as const
`

	const metaInformation = modules
		.sort((a, b) => a.name.localeCompare(b.name))
		.map((current) => {
			const properties = Object.entries(current)
				.filter(([key]) => key !== 'name')
				.map(([key, value]) => `"${key}": "${value}",`)
				.join(' ')
			return `"${current.name}": { ${properties} },`
		})
		.join('\n')

	return template.replace(ts`// metainformation`, metaInformation)
}

function parseGitmodulesFile(file: string) {
	const lines = file.split('\n')
	const modules = new Array<Module>()

	for (const line of lines) {
		if (!line) continue
		if (line.startsWith('[submodule ')) {
			const currentModule = line
				.replace('[submodule "', '')
				.replace('"]', '')
				.trim()
			modules.push({ name: currentModule })
			continue
		}

		if (!line.includes('=')) continue

		const [key, value] = line.split('=')
		const lastIndex = modules.length - 1
		const trimmedKey = key.trim()
		const trimmedValue = value.trim()

		modules[lastIndex][trimmedKey] = trimmedValue
	}

	return modules
}


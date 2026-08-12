
import * as cp from 'node:child_process'

import type { Submodule } from './types';

import { SubmoduleMetaInformation } from './constants'

const startDirectory = process.cwd();

export function sh(strings: TemplateStringsArray, ...values: string[]) {
	return cp.execSync(strings.reduce((previous, current, index) => {
		const value = values[index - 1];
		return `${previous}${value}${current}`;
	}), { stdio: 'inherit' });
}

export function isSubmodule(input: unknown): input is Submodule {
	return !!SubmoduleMetaInformation[input as Submodule]
}

export function chdir(newDirectory: string, callback: () => void) {
	process.chdir(newDirectory);
	callback();
	process.chdir(startDirectory);
}

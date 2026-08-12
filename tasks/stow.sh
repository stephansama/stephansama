#!/usr/bin/env sh
#USAGE flag "-r --remove" help="remove stow"
#USAGE flag "-c --clean" help="clean existing stow implementation"

ARGS=""

if [ -n "${usage_remove}" ]; then
	ARGS="-D"
	echo "removing stow"
else
	echo "adding stow"
fi

if [ -n "${usage_clean}" ]; then
	stow -D . && stow "${ARGS}" .
else
	stow "${ARGS}" .
fi

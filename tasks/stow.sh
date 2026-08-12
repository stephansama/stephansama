#!/usr/bin/env sh
#USAGE flag "-r --remove" help="remove stow"

ARGS=""

if [ -n "${usage_remove}" ]; then
	ARGS="-D"
	echo "removing stow"
else
	echo "adding stow"
fi

stow "${ARGS}" .

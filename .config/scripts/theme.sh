#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo 'Dark'
elif [[ "$OSTYPE" == "darwin"* ]]; then
	defaults read -g AppleInterfaceStyle
elif [[ "$OSTYPE" == "cygwin" ]]; then
	echo 'cygwin'
elif [[ "$OSTYPE" == "msys" ]]; then
	echo 'msys'
elif [[ "$OSTYPE" == "freebsd"* ]]; then
	echo 'msys'
else
	echo 'idk'
fi

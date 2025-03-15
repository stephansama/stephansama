#!/bin/bash

query=$(
	find "$CODE" -type d -mindepth 1 -maxdepth 1 | sed "s@$CODE/@@g" | fzf \
		--ansi \
		--preview="lsd $CODE/{}"
)

cd "$CODE/$query" || exit

nvim .

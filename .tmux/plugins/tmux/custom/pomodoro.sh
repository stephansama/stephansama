#!/bin/bash

# If this module depends on an external Tmux plugin, say so in a comment.
# E.g.: Requires https://github.com/olimorris/tmux-pomodoro-plus/
show_pomodoro() {
	local index icon color text module

	index=$1 # This variable is used internally by the module loader in order to know the position of this module

	icon="$(get_tmux_option "@catppuccin_pomodoro_icon" "")"
	color="$(get_tmux_option "@catppuccin_pomodoro_color" "$thm_red")"
	text="$(get_tmux_option "@catppuccin_pomodoro_text" "#($HOME/.tmux/plugins/tmux-pomodoro-plus/scripts/pomodoro.sh)")"

	module=$(build_status_module "$index" "$icon" "$color" "$text")

	echo "$module"
}

local M = {}
local keys = require("keys")
local const = require("const")
local wezterm = require("wezterm")
local is_tmux = require("utils").is_tmux

local gui_startup = function(cmd)
	--- maximize on creation
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end

--- https://www.reddit.com/r/wezterm/comments/1fy21ft/comment/lqyd2qh/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
local update_status = function(window, pane)
	window:set_config_override({ keys = keys.tmux_keys, leader = const.LEADER_KEY })
	if is_tmux(pane) then
		window:set_config_override({ keys = keys.keys })
	else
		window:set_config_override({ keys = keys.tmux_keys, leader = const.LEADER_KEY })
	end
end

--- register all events to wezterm instance
M.register = function()
	wezterm.on("gui-startup", gui_startup)
	wezterm.on("update-status", update_status)
end

return M

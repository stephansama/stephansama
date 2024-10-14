local M = {}
local action = require("wezterm").action

local launch_command_pallette = action.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" })
local launch_char_select = action.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" })

M.keys = {
	{ key = "l", mods = "ALT", action = launch_command_pallette },
	{ key = "s", mods = "CTRL", action = launch_char_select },
}

M.tmux_keys = {
	{ key = "s", mods = "LEADER", action = launch_char_select },
	{ key = "c", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
	table.unpack(M.keys),
}

M.apply_to_config = function(config)
	config.keys = M.keys
end

return M

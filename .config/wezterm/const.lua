local wezterm = require("wezterm")
local HOME = wezterm.home_dir
local M = {}

M.BACKGROUND_BLUR = 10
M.BACKGROUND_OPACITY = 0.9

M.FONT_NAME = "FiraCode Nerd Font Mono"
M.FONT_SIZE = 23

M.INIT_SCRIPT = HOME .. "/.config/scripts/launch-tmux.sh"

M.LAUNCH_MENU = {
	{ label = "GitHub Dashboard", args = { "gh", "dash" } },
	{ label = "GitHub Eco", args = { "gh", "eco" } },
	{ label = "Lazy Docker", args = { "lazydocker" } },
	{ label = "Lazy SQL", args = { "lazysql" } },
	{ label = "Posting", args = { "posting" } },
	{ label = "Ranger", args = { "ranger" } },
	{ label = "TMUX", args = { "tmux" } },
}

M.LEADER_KEY = { key = "b", mods = "CTRL", timeout_milliseconds = 10000 }

M.PATH = "/opt/homebrew/bin/:" .. HOME .. "/go/bin/:" .. HOME .. "/.local/bin/:" .. os.getenv("PATH")

return M

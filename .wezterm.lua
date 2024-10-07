---@see Documentation https://wezfurlong.org/wezterm/config/files.html
local wezterm = require("wezterm")
local config = wezterm.config_builder()

--- maximize on creation
wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

--- launch tmux or attach to open session
config.default_gui_startup_args = { "start", "--", wezterm.home_dir .. "/.config/scripts/launch-tmux.sh" }

--- add to wezterm path
config.set_environment_variables = {
	PATH = "/opt/homebrew/bin/:"
		.. wezterm.home_dir
		.. "/go/bin/:"
		.. wezterm.home_dir
		.. "/.local/bin/:"
		.. os.getenv("PATH"),
}

config.launch_menu = {
	{ label = "GitHub Dashboard", args = { "gh", "dash" } },
	{ label = "GitHub Eco", args = { "gh", "eco" } },
	{ label = "Lazy Docker", args = { "lazydocker" } },
	{ label = "Lazy SQL", args = { "lazysql" } },
	{ label = "Posting", args = { "posting" } },
	{ label = "Ranger", args = { "ranger" } },
	{ label = "TMUX", args = { "tmux" } },
}

config.keys = {
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }) },
	{
		key = "s",
		mods = "CTRL",
		action = wezterm.action.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
}

config.hyperlink_rules = wezterm.default_hyperlink_rules()

config.command_palette_font_size = 30
config.command_palette_rows = 5

--- font
config.font_size = 23
config.font = wezterm.font("FiraCode Nerd Font Mono")

--- tab
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

--- window
config.native_macos_fullscreen_mode = true
config.macos_window_background_blur = 10
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_padding = { top = 0, left = 0, right = 0, bottom = 0 }

--- catppuccin theme
---@see catppuccin_documentation https://github.com/catppuccin/wezterm
local function get_colorscheme(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = get_colorscheme(wezterm.gui.get_appearance())

return config

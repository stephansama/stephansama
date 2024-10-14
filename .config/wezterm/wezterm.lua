local ui = require("ui")
local keys = require("keys")
local const = require("const")
local events = require("events")
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.launch_menu = const.LAUNCH_MENU
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.default_gui_startup_args = { "start", "--", const.INIT_SCRIPT }
config.set_environment_variables = { PATH = const.PATH }

ui.apply_to_config(config)
keys.apply_to_config(config)
events.register()

return config

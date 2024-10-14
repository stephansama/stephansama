local M = {}

--- determine whether or not current wezterm pane is in tmux or not
---@param pane table current wezterm pane
---@return boolean
M.is_tmux = function(pane)
	return pane:get_user_vars().WEZTERM_IN_TMUX == "1"
end

return M

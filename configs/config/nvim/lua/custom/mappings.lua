---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
    ["gg"] = { "ggzz" },
    ["G"] = { "Gzz" },
    ["k"] = { "gkzz" },
    ["j"] = { "gjzz" },
    ["n"] = { "nzz", "Previous search result" },
    ["N"] = { "Nzz", "Next search result" },
    ["o"] = { "o<ESC>zz", "New line up" },
    ["O"] = { "O<ESC>zz", "New line down" },
    ["Q"] = { "@q", "Replay Quick Macro" },
    ["Y"] = { "y$", "Yank till end of line" },
    ["H"] = { "^zz", "Go to beginning of line" },
    ["L"] = { "$zz", "Go to end of line" },
    ["%"] = { "%zz", "Go to matching bracket" },
    ["{"] = { "{zz", "Go to previous block" },
    ["}"] = { "}zz", "Go to next block" },
    ["<C-d>"] = { "<C-d>zz", "Go down half page" },
    ["<C-u>"] = { "<C-u>zz", "Go up half page" },
    ["<A-j>"] = { "ddkP", "Move line up" },

    -- Text selection
    ["cw"] = { "ciw" },
    ["dw"] = { "diw" },
    ["vw"] = { "viw" },
    ["yw"] = { "yiw" },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M

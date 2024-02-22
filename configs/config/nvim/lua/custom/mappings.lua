--
---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-CR>"] = {
      function()
        print "test"
      end,
    },
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>c"] = { "<cmd> q <CR>", "Close buffer/window" },
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
    ["H"] = { "^zz", "Go to beginning of line" },
    ["L"] = { "$zz", "Go to end of line" },
    ["Y"] = { "y$", "Yank till end of line" },
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

    ["<leader>ti"] = {
      function()
        require("lsp-inlayhints").toggle()
      end,
      "toggle inlay hints",
    },

    ["]t"] = {
      function()
        require("todo-comments").jump_next()
      end,
      "Next todo comment",
    },
    ["[t"] = {
      function()
        require("todo-comments").jump_prev()
      end,
      "Previous todo comment",
    },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<leader>u"] = {
      function()
        vim.cmd.UndotreeToggle()
        vim.cmd.UndotreeFocus()
      end,
      "UndotreeToggle",
    },
  },
  o = {
    ["Y"] = { "y$", "Yank till end of line" },
  },
  v = {
    ["H"] = { "^zz", "Go to beginning of line" },
    ["L"] = { "$zz", "Go to end of line" },
    [">"] = { ">gv", "indent" },
  },
}

-- c?: table<string, KeymapConfig>,
--    i?: table<string, KeymapConfig>,
--    l?: table<string, KeymapConfig>,
--    n?: table<string, KeymapConfig>,
--    o?: table<string, KeymapConfig>,
--    plugin?: boolean,
--    s?: table<string, KeymapConfig>,
--    t?: table<string, KeymapConfig>,
--    v?: table<string, KeymapConfig>,
--    x?: table<string, KeymapConfig>,
--    ["!"]?: table<string, KeymapConfig>,
--    [""]?: table<string, KeymapConfig>

-- local actions = require "telescope.actions"
-- local trouble = require "trouble.providers.telescope"

-- local telescope = require "telescope"
M.obsidian = {
  n = {
    ["<leader>oo"] = { "<cmd> ObsidianOpen <CR>", "Open with obsidian" },
    ["<leader>ot"] = { "<cmd> ObsidianTemplate <CR>", "Open possible templates with obsidian" },
    ["<leader>og"] = { "<cmd> ObsidianTags <CR>", "Open used tags with obsidian" },
    ["<leader>os"] = { "<cmd> ObsidianSearch <CR>", "Open search with obsidian" },
  },
}

M.telescope = {

  n = {
    -- todo comments
    ["<leader>tt"] = { "<cmd> TodoTelescope <CR>", "Todo Telescope" },
    -- ["<leader>xx"] = {
    --   trouble.open_with_trouble,
    --   "Trouble Telescope",
    -- },
  },
}

-- more keybinds!

return M

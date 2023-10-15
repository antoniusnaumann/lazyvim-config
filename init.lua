-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")
vim.cmd("hi Normal guibg=#14191e")
vim.cmd("hi NormalNC guibg=#181b21")
vim.cmd("hi NormalFloat guibg=#212429")

local telescopeActions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = telescopeActions.close,
      },
    },
  },
})

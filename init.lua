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

vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#121519", blend = 0 })
require("cmp").setup({
  view = {
    menu = {
      winhighlight = "Normal:CmpNormal",
    },
  },
  window = {
    completion = {
      winhighlight = "Normal:CmpNormal",
    },
  },
})

return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "<leader>k", vim.lsp.buf.hover, desc = "Hover" }
    keys[#keys + 1] = { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action" }
  end,
}

-- shortcut to messages buffer is `g<`
require("vim._core.ui2").enable({})

-- This must be at the VERY TOP of init.lua
-- otherwise nvim defaults to the vim home screen
-- the only exception is the core ui above for better errors
vim.pack.add({
  "https://github.com/goolord/alpha-nvim",
  "https://github.com/echasnovski/mini.icons",
  "https://github.com/nvim-lua/plenary.nvim",
})
require("alpha").setup(require("alpha-theme").config)
vim.keymap.set("n", "<leader>a", "<cmd>Alpha<cr>")
-- end This must be at the VERY TOP of init.lua

require("options")
require("keymaps")
require("lsp")

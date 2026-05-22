vim.pack.add({
  "https://github.com/tpope/vim-dadbod",
  "https://github.com/kristijanhusak/vim-dadbod-ui",   -- not in opt/
  "https://github.com/kristijanhusak/vim-dadbod-completion",
})

vim.g.db_ui_use_nerd_fonts = 1
vim.api.nvim_set_hl(0, 'NotificationInfo', { fg = "#8A8A8A", bg = "#201D1D" })
vim.api.nvim_set_hl(0, 'NotificationWarning', { fg = "#FFA066", bg = "#201D1D" })
vim.api.nvim_set_hl(0, 'NotificationError', { fg = "#FF5D62", bg = "#201D1D" })

vim.keymap.set("n", "<leader>D", "<cmd>DBUIToggle<CR>", { desc = "Toggle DBUI" })


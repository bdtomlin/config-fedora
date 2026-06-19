vim.pack.add({
  "https://github.com/m4xshen/autoclose.nvim"
})

require("autoclose").setup({})

-- Re-set after autoclose.nvim overrides it
vim.keymap.set("i", "<S-CR>", function()
  local saved = vim.o.formatoptions
  vim.o.formatoptions = saved:gsub("[cro]", "")
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "t", false)
  vim.defer_fn(function()
    vim.o.formatoptions = saved
    vim.fn["codeium#Complete"]()
  end, 150)
end, { noremap = true })

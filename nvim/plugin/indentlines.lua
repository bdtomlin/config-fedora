vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })

vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3B3B3B" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#875F5F" })

require("ibl").setup({
  indent = { char = "▏" },
  scope = {
    show_start = false,
    show_end = false,
  }
})


vim.pack.add({
  "https://github.com/swaits/zellij-nav.nvim",
})

-- this only loads zellij-nav when one of the mapped keys is pressed
local loaded = false

local function load_zellij_nav()
  if loaded then return end

  vim.cmd.packadd("zellij-nav.nvim")
  require("zellij-nav").setup({})
  loaded = true
end

vim.keymap.set("n", "<C-h>", function()
  load_zellij_nav()
  vim.cmd("ZellijNavigateLeft")
end, { silent = true, desc = "navigate left" })

vim.keymap.set("n", "<C-j>", function()
  load_zellij_nav()
  vim.cmd("ZellijNavigateDown")
end, { silent = true, desc = "navigate down" })

vim.keymap.set("n", "<C-k>", function()
  load_zellij_nav()
  vim.cmd("ZellijNavigateUp")
end, { silent = true, desc = "navigate up" })

vim.keymap.set("n", "<C-l>", function()
  load_zellij_nav()
  vim.cmd("ZellijNavigateRight")
end, { silent = true, desc = "navigate right" })

vim.pack.add({
  "https://github.com/github/copilot.vim.git",
})

-- Disable default Tab mapping for Copilot
vim.g.copilot_no_tab_map = true

-- Map Ctrl+J to accept Copilot suggestion
vim.keymap.set("i", "<C-y>", function()
  return vim.fn["copilot#Accept"]("<CR>")
end, {
  expr = true,
  silent = true,
  desc = "Accept Copilot suggestion",
})

vim.pack.add({
  "https://github.com/Exafunction/windsurf.vim",
})

-- Keymaps matching your old Copilot bindings
vim.g.codeium_no_map_tab = true
vim.keymap.set("i", "<C-a>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, desc = "Accept completion" })
vim.keymap.set("i", "<C-j>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, desc = "Next completion" })
vim.keymap.set("i", "<C-k>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, desc = "Prev completion" })
vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, desc = "Dismiss completion" })

-- blink.cmp fires CompleteChanged constantly, resetting Codeium's debounce
-- timer and preventing suggestions from appearing. Remove that trigger.
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.cmd("augroup codeium | autocmd! CompleteChanged | augroup END")
  end,
})

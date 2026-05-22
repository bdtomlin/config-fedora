vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/kdheepak/lazygit.nvim",
})

local lazygit_loaded = false

local function load_lazygit()
  if lazygit_loaded then
    return
  end

  vim.cmd.packadd("plenary.nvim")
  vim.cmd.packadd("lazygit.nvim")

  lazygit_loaded = true
end

vim.keymap.set("n", "<leader>gl", function()
  load_lazygit()
  vim.cmd("LazyGit")
end, { desc = "LazyGit" })

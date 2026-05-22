vim.pack.add({ "https://github.com/folke/flash.nvim" })

local flash_loaded = false

local function load_flash()
  if flash_loaded then
    return require("flash")
  end

  vim.cmd.packadd("flash.nvim")

  require("flash").setup({
    labels = "asdfghjklqwertyuiopzxcvbnm",
    label = { rainbow = { enabled = false } },
    modes = {
      char = { jump_labels = false },
      search = { enabled = false },
    },
  })

  flash_loaded = true
  return require("flash")
end

-- Keymaps that trigger loading
vim.keymap.set({ "n", "x", "o" }, "s", function() load_flash().jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() load_flash().treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function() load_flash().remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() load_flash().treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<C-s>", function() load_flash().toggle() end, { desc = "Toggle Flash Search" })

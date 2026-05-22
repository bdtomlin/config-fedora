-- Neogit + Diffview (built-in pack manager)
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",      -- already used by Telescope
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/NeogitOrg/neogit",
})

-- One-time loader
local neogit_loaded = false

local function load_neogit()
  if neogit_loaded then
    return
  end

  vim.cmd.packadd("plenary.nvim")
  vim.cmd.packadd("diffview.nvim")
  vim.cmd.packadd("neogit")

  -- Diffview setup
  require("diffview").setup({
    use_icons = false,        -- your original setting
  })

  -- Neogit setup
  require("neogit").setup({
    use_icons = true,         -- your original setting
    -- Add more config here if needed, e.g.:
    -- integrations = { diffview = true },
    -- kind = "split",
  })

  neogit_loaded = true
end

-- === Keymaps ===
vim.keymap.set("n", "<leader>gg", function()
  load_neogit()
  vim.cmd("Neogit")
end, { desc = "Neogit" })

vim.keymap.set("n", "<leader>gc", function()
  load_neogit()
  vim.cmd("Neogit commit")
end, { desc = "Neogit Commit" })

-- Optional: make the :Neogit command lazy too
vim.api.nvim_create_user_command("Neogit", function(args)
  load_neogit()
  vim.cmd("Neogit " .. (args.args or ""))
end, { nargs = "*" })

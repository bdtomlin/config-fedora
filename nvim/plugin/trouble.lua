-- trouble.nvim (built-in pack manager)
vim.pack.add({
  "https://github.com/folke/trouble.nvim",
})

-- One-time loader
local trouble_loaded = false

local function load_trouble()
  if trouble_loaded then
    return
  end

  vim.cmd.packadd("trouble.nvim")

  -- Setup (use {} for default config)
  require("trouble").setup({})

  trouble_loaded = true
end

-- Keymaps (load plugin on first use)
vim.keymap.set("n", "<leader>xx", function()
  load_trouble()
  vim.cmd("Trouble diagnostics toggle")
end, { desc = "Diagnostics (Trouble)" })

vim.keymap.set("n", "<leader>xX", function()
  load_trouble()
  vim.cmd("Trouble diagnostics toggle filter.buf=0")
end, { desc = "Buffer Diagnostics (Trouble)" })

vim.keymap.set("n", "<leader>cs", function()
  load_trouble()
  vim.cmd("Trouble symbols toggle focus=false")
end, { desc = "Symbols (Trouble)" })

vim.keymap.set("n", "<leader>cl", function()
  load_trouble()
  vim.cmd("Trouble lsp toggle focus=false win.position=right")
end, { desc = "LSP Definitions / references / ... (Trouble)" })

vim.keymap.set("n", "<leader>xL", function()
  load_trouble()
  vim.cmd("Trouble loclist toggle")
end, { desc = "Location List (Trouble)" })

vim.keymap.set("n", "<leader>xQ", function()
  load_trouble()
  vim.cmd("Trouble qflist toggle")
end, { desc = "Quickfix List (Trouble)" })

-- Also make the :Trouble command lazy
vim.api.nvim_create_user_command("Trouble", function(args)
  load_trouble()
  vim.cmd("Trouble " .. args.args)
end, { nargs = "*", complete = function()
  -- Optional: command completion
  return { "diagnostics", "symbols", "lsp", "loclist", "qflist", "todo" }
end })

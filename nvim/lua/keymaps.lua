-- Diffview
-- vim.keymap.set(
--   "n",
--   "<leader>df",
--   "<cmd>DiffviewFileHistory %<cr>",
--   { desc = "Diffview Current File History", silent = true }
-- )
-- vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview History", silent = true })
-- vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "Diffview Close", silent = true })
-- vim.keymap.set("n", "<leader>dl", "<cmd>DiffviewLog<cr>", { desc = "Diffview Log", silent = true })
-- vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "Diffview Open", silent = true })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy.nvim", silent = true })

-- -- Oil.nvim
-- -- vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
-- vim.keymap.set("n", "<leader>e", "<cmd>Yazi<cr>")
-- -- Neogit
-- vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>")
-- -- Gitui
-- vim.keymap.set("n", "<leader>gu", "<cmd>Gitui<cr>")
-- -- Lazygit
-- vim.keymap.set("n", "<leader>gl", "<cmd>LazyGit<cr>")
-- -- Turn of search highlight
-- vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")
--
-- local bufdelete = require("btomlin.bufdelete")

-- horizontal scroll
vim.keymap.set({ "n", "t" }, "zh", "30zh")
vim.keymap.set({ "n", "t" }, "zl", "30zl")

local function horizontal_scroll_mode(call_char)
  if vim.wo.wrap then
    return
  end

  vim.api.nvim_echo({ { "-- Horizontal scrolling mode (h/l/H/L)", "Title" } }, false, {})

  local typed_char = call_char
  while vim.tbl_contains({ "h", "l", "H", "L" }, typed_char) do
    -- Perform horizontal scroll command
    vim.cmd("normal! z" .. typed_char)

    -- Redraw and show mode message
    vim.cmd("redraw")
    vim.api.nvim_echo({ { "-- Horizontal scrolling mode (h/l/H/L)", "Title" } }, false, {})

    -- Wait for the next key input
    typed_char = vim.fn.nr2char(vim.fn.getchar())
  end

  -- Clear message and reset highlighting
  vim.cmd("redraw")
  vim.api.nvim_echo({}, false, {})
end

-- Keymaps to call the Lua function
vim.keymap.set("n", "zh", function()
  horizontal_scroll_mode("h")
end, { silent = true })
vim.keymap.set("n", "zl", function()
  horizontal_scroll_mode("l")
end, { silent = true })
vim.keymap.set("n", "zH", function()
  horizontal_scroll_mode("H")
end, { silent = true })
vim.keymap.set("n", "zL", function()
  horizontal_scroll_mode("L")
end, { silent = true })

vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<cr>")

-- Based on the primagen's video https://www.youtube.com/watch?v=w7i4amO_zaE&t=9s
-- keep cursor position when using J
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
-- keep cursor in middle of screen for scrolling
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
-- keep cursor in middle of screen when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy/paste
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "Q", "<nop>")


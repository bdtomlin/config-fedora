local wk = require("which-key")

-- Diffview
vim.keymap.set(
  "n",
  "<leader>df",
  "<cmd>DiffviewFileHistory %<cr>",
  { desc = "Diffview Current File History", silent = true }
)
vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview History", silent = true })
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "Diffview Close", silent = true })
vim.keymap.set("n", "<leader>dl", "<cmd>DiffviewLog<cr>", { desc = "Diffview Log", silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "Diffview Open", silent = true })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy.nvim", silent = true })
vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope<cr>", { desc = "Telescope", silent = true })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files", silent = true })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope commands", silent = true })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep", silent = true })
vim.keymap.set("n", "<leader>fG", builtin.git_files, { desc = "Telescope git files", silent = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers", silent = true })
vim.keymap.set("n", "<leader>.", builtin.buffers, { desc = "Telescope buffers", silent = true })
vim.keymap.set("n", "<leader>fh", builtin.command_history, { desc = "Telescope command history", silent = true })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Telescope marks", silent = true })
vim.keymap.set("n", '<leader>f"', builtin.registers, { desc = "Telescope registers", silent = true })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope git status", silent = true })

-- Obsidian
-- vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "ObsidianNew", silent = true })
-- vim.keymap.set("n", "<leader>oa", "<cmd>ObsidianLink<cr>", { desc = "ObsidianLink", silent = true })
-- vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<cr>", { desc = "ObsidianTags", silent = true })
-- vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "ObsidianOpen", silent = true })
-- vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "ObsidianLinks", silent = true })
-- vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "ObsidianRename", silent = true })
-- vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "ObsidianSearch", silent = true })
-- vim.keymap.set("n", "<leader>oc", "<cmd>ObsidianTOC<cr>", { desc = "ObsidianTOC", silent = true })
-- vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "ObsidianBacklinks", silent = true })
-- vim.keymap.set("n", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { desc = "ObsidianExtractNote", silent = true })

-- Alpha
vim.keymap.set("n", "<leader>a", "<cmd>Alpha<cr>")
-- Oil.nvim
-- vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>Yazi<cr>")
-- Neogit
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>")
-- Gitui
vim.keymap.set("n", "<leader>gu", "<cmd>Gitui<cr>")
-- Lazygit
vim.keymap.set("n", "<leader>gl", "<cmd>LazyGit<cr>")
-- Turn of search highlight
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

local bufdelete = require("btomlin.bufdelete")
wk.add({
  { "<leader>bn", "<cmd>bn<cr>", desc = "Buffer Next" },
  { "<leader>bp", "<cmd>bp<cr>", desc = "Buffer Previous" },
  { "<leader>bb", "<cmd>b#<cr>", desc = "Buffer Last" },
  { "<leader>bw", "<cmd>bw<cr>", desc = "Buffer Wipe" },
  {
    "<leader>bd",
    function()
      bufdelete()
    end,
    desc = "Buffer Delete Stay",
  },
})

-- Tab nav overrides
wk.add({
  { "<leader><tab>n", "<cmd>tabnext<cr>", desc = "Next Tab" },
  { "<leader><tab>p", "<cmd>tabprevious<cr>", desc = "Previous Tab" },
  { "<leader><tab>e", "<cmd>tabedit %<cr>", desc = "Edit Buffer In New Tab" },
  { "<leader>bn", "<cmd>bn<cr>", desc = "Buffer Next" },
  { "<leader>bp", "<cmd>bp<cr>", desc = "Buffer Previous" },
})

-- Navigator.nvim
-- vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
-- vim.keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>")
vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>ZellijNavigateLeftTab<cr>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>ZellijNavigateDown<cr>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>ZellijNavigateUp<cr>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>ZellijNavigateRightTab<cr>")

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

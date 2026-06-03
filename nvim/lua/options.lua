vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.confirm = true

-- trackpad support
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- for obsidian this must be 1 or 2
vim.opt.conceallevel = 1

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 0
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true

vim.g.mapleader = " "

-- vim.opt.iskeyword:remove({ "_" })
-- vim.opt.iskeyword:add({ "-" })

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
end

vim.opt.laststatus = 2 -- every window gets it's own status bar
vim.o.stl = " %f %m %=%y[%L] %l,%c "
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

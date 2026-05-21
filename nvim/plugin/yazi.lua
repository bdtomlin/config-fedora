vim.pack.add({
  "https://github.com/mikavilpas/yazi.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
})

vim.keymap.set({"n", "v"}, "<leader>e", function()
  require("yazi").yazi()
end, {desc = "Open yazi at the current file"})
vim.keymap.set({"n", "v"}, "<leader>E", function()
  require("yazi").cwd()
end, {desc = "Open yazi at the working dir"})
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
      keymaps = {
        show_help = "<f1>",
      },
    })
  end,
})

-- require("yazi.nvim").setup({
--   keys = {
--     -- 👇 in this section, choose your own keymappings!
--     {
--       "<leader>e",
--       mode = { "n", "v" },
--       "<cmd>Yazi<cr>",
--       desc = "Open yazi at the current file",
--     },
--     {
--       -- Open in the current working directory
--       "<leader>E",
--       "<cmd>Yazi cwd<cr>",
--       desc = "Open the file manager in nvim's working directory",
--     },
--     {
--       "<c-up>",
--       "<cmd>Yazi toggle<cr>",
--       desc = "Resume the last yazi session",
--     },
--   },
--   ---@type YaziConfig | {}
--   opts = {
--     -- if you want to open yazi instead of netrw, see below for more info
--     open_for_directories = true,
--     keymaps = {
--       show_help = "<f1>",
--     },
--   },
--   -- 👇 if you use `open_for_directories=true`, this is recommended
--   init = function()
--     -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
--     -- vim.g.loaded_netrw = 1
--     vim.g.loaded_netrwPlugin = 1
--   end,
-- })

-- Put this at the VERY TOP of your init.lua (before anything else)
vim.pack.add({
  "https://github.com/goolord/alpha-nvim",
  "https://github.com/echasnovski/mini.icons",
})

vim.defer_fn(function()
  local ok, alpha = pcall(require, "alpha")
  if not ok then return end

  -- Load your custom theme
  local theme_ok, config = pcall(require, "alpha-theme")
  if theme_ok and config then
    alpha.setup(config)
  else
    alpha.setup(require("alpha.themes.dashboard").config)
  end

  -- Show on clean startup
  if vim.fn.argc() == 0 and vim.bo.buftype == "" then
    vim.schedule(function()
      alpha.start(false)
    end)
  end
end, 80)

require("options")
require("keymaps")
require("lsp")

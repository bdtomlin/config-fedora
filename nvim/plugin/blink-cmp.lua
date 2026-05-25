vim.pack.add({ "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" })
local cmp = require("blink.cmp")
cmp.build():wait(60000)
-- cmp.setup()
cmp.setup({
  -- 'default' for standard Vim-style completion
  -- 'super-tab' for VSCode-like Tab/Shift-Tab completion behaviors
  -- keymap = { preset = "super-tab" },
  keymap = { preset = "default" },

  appearance = {
    -- Fallback to nvim-cmp's highlight groups if your theme doesn't support blink yet
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },

  -- Sources to pull suggestions from
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})

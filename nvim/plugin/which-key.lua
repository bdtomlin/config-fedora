vim.pack.add({
  "https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")

local bufdelete = require("btomlin.bufdelete")

wk.setup({})

wk.add({
  {
    "<leader>?",
    function()
      wk.show({ global = false })
    end,
    desc = "Buffer Local Keymaps",
  },

  -- Example groups
  { "<leader>f", group = "file" },
  { "<leader>b", group = "buffer" },
})

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

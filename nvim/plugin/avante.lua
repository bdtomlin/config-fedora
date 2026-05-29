vim.pack.add({
  "https://github.com/yetone/avante.nvim.git",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  {
    src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup({
        file_types = { "markdown", "Avante" },
      })
    end,
  },
})

-- avante setup — place after the pack/ensure block above
require("avante").setup({
  -- Use Claude Code CLI as the backend (your subscription, no per-token billing)
  provider = "claude-code",

  -- ACP provider config: avante spawns claude-code-acp via npx
  acp_providers = {
    ["claude-code"] = {
      command = "npx",
      args = { "@zed-industries/claude-code-acp" },
      env = {
        NODE_NO_WARNINGS = "1",
        ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY"),
      },
    },
  },

  behaviour = {
    auto_suggestions = false,
    auto_set_keymaps = false, -- we set them manually below
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = true,
  },

  windows = {
    position = "right",
    width = 35,
    sidebar_header = { rounded = true },
  },

  -- Map to your existing <leader>c* muscle memory
  mappings = {
    diff = {
      ours = "co", -- accept our version in conflict
      theirs = "ct", -- accept Claude's version
      both = "cb",
      next = "]c",
      prev = "[c",
    },
  },
})

-- Keymaps — mirrors your CopilotChat layout as closely as possible
local map = vim.keymap.set

-- Chat / Ask  (<leader>cc was your CopilotChat toggle)
map({ "n", "v" }, "<leader>cc", "<cmd>AvanteAsk<CR>", { desc = "Claude Ask" })

-- Open / Close  (was <leader>co / <leader>cx)
map("n", "<leader>co", "<cmd>AvanteToggle<CR>", { desc = "Claude Open/Toggle" })
map("n", "<leader>cx", "<cmd>AvanteToggle<CR>", { desc = "Claude Close/Toggle" })

-- Explain  (was <leader>ce — select code first, then call)
map({ "n", "v" }, "<leader>ce", function()
  require("avante.api").ask({ question = "Explain this code" })
end, { desc = "Claude Explain" })

-- Review  (was <leader>cr)
map({ "n", "v" }, "<leader>cr", function()
  require("avante.api").ask({ question = "Review this code for bugs, style issues, and improvements" })
end, { desc = "Claude Review" })

-- Edit in-place (no Copilot equivalent — but very useful)
map({ "n", "v" }, "<leader>ce", "<cmd>AvanteEdit<CR>", { desc = "Claude Edit" })

-- Refresh last response
map("n", "<leader>cR", "<cmd>AvanteRefresh<CR>", { desc = "Claude Refresh" })

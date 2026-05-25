vim.pack.add({
  "https://github.com/github/copilot.vim.git",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

-- Disable default Tab mapping for Copilot
vim.g.copilot_no_tab_map = true

-- Map Ctrl+y to accept Copilot suggestion
vim.keymap.set("i", "<C-y>", function()
  return vim.fn["copilot#Accept"]("<CR>")
end, {
  expr = true,
  silent = true,
  desc = "Accept Copilot suggestion",
})

vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Copilot Chat" })
vim.keymap.set("n", "<leader>co", "<cmd>CopilotChatOpen<CR>", { desc = "Copilot Open" })
vim.keymap.set("n", "<leader>cx", "<cmd>CopilotChatClose<CR>", { desc = "Copilot Close" })
vim.keymap.set("n", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "Copilot Explain" })
vim.keymap.set("n", "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "Copilot Review" })

require("CopilotChat").setup({
  -- ... your existing configuration ...
  mappings = {
    accept_diff = {
      normal = "<C-a>", -- Moves the diff action away from <C-y> in normal mode
      insert = "<C-a>", -- Moves the diff action away from <C-y> in insert mode
    },
  },
})

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/zapling/mason-conform.nvim",
})

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    -- lsps
    "gopls",
    "rust-analyzer",
    -- "html",
    "templ",
    "emmet_ls",
    "hyprls",
    "just-lsp",
    -- formatters
    "stylua",
    "gofumpt",
    "biome",
    -- dap
    "codelldb",
  },
})

require("mason-lspconfig").setup({})

-- Optional: per-server overrides using the new native API
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      telemetry = { enable = false },
    },
  },
})

-- ========================
-- Formatting with conform.nvim
-- ========================
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "black" }, -- or just "ruff_format"
    javascript = { "prettier", "biome" },
    typescript = { "prettier", "biome" },
    javascriptreact = { "prettier", "biome" },
    typescriptreact = { "prettier", "biome" },
    json = { "prettier", "biome" },
    html = { "prettier" },
    css = { "prettier" },
    markdown = { "prettier" },
    go = { "goimports", "gofmt" },
    rust = { "rustfmt" },
    -- Add more as needed
  },

  -- Optional: Default format options
  default_format_opts = {
    lsp_format = "fallback", -- Use LSP formatting if no dedicated formatter
  },

  -- Format on save
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
})

-- Optional: Manual formatting keymap
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format code" })

-- ========================
-- Auto-install formatters with Mason
-- ========================
require("mason-conform").setup({
  -- Optional: ignore certain formatters
  -- ignore_install = { "prettier" },
})

-- ========================
-- Optional: nice LSP defaults
-- ========================
vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = { border = "rounded", source = "if_many" },
  virtual_text = { spacing = 2, source = "if_many", prefix = "●" },
})

-- Example LspAttach keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
    end

    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.enable({
  "lua_ls",
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<C-x>", vim.diagnostic.open_float)

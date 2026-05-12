return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        rubocop = {
          -- Tell conform to run via Mise
          command = "mise",
          args = {
            "x",
            "--",
            "rubocop",
            "--autocorrect-all",
            "--stdin",
            "$FILENAME",
            "--format",
            "quiet",
            "--stderr",
          },
          stdin = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        templ = { "templ" },
        ruby = { "rubocop" },
        -- ruby = { "standardrb" },
        eruby = { "erb_format" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescirpt = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettier" },
        html = { "prettier" },
        xhtml = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    })
  end,
}

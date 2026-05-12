return {
  {
    {
      "L3MON4D3/LuaSnip",
      config = function()
        -- check out https://github.com/honza/vim-snippets/tree/master/snippets for examples
        -- this is why I'm using snipmate style, because there are so many examples
        -- available
        require("luasnip.loaders.from_snipmate").lazy_load()
      end,
    },
    {
      "williamboman/mason.nvim",
      lazy = false,
      dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
      },
      config = function()
        local mason = require("mason")
        local mason_tool_installer = require("mason-tool-installer")
        -- enable mason and configure icons
        mason.setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        })
        mason_tool_installer.setup({
          ensure_installed = {
            "gopls",
            "html",
            "templ",
            "emmet_ls",
            "hyprls",
            "stylua",
            "gofumpt",
            "prettierd",
            "prettier",
          },
        })
      end,
    },

    -- Autocompletion
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
          mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-y>"] = cmp.mapping.confirm({ select = true }, cmp_select),
          }),
          -- sources = {
          --   { name = 'nvim_lsp' },
          -- },
          -- snippet = {
          --   expand = function(args)
          --     vim.snippet.expand(args.body)
          --   end,
          -- },
          sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "render-markdown" },
          },
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
        })
      end,
    },
    { "saadparwaiz1/cmp_luasnip" },
    -- LSP
    {
      "neovim/nvim-lspconfig",
      cmd = { "LspInfo", "LspInstall", "LspStart" },
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
      },
      init = function()
        -- Reserve a space in the gutter
        -- This will avoid an annoying layout shift in the screen
        vim.opt.signcolumn = "no"
      end,
      config = function()
        local lsp_defaults = require("lspconfig").util.default_config

        -- Add cmp_nvim_lsp capabilities settings to lspconfig
        -- This should be executed before you configure any language server
        lsp_defaults.capabilities =
          vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

        -- LspAttach is where you enable features that only work
        -- if there is a language server active in the file
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then
              return
            end

            -- if client.supports_method("textDocument/formatting") then
            --   vim.api.nvim_create_autocmd("BufWritePre", {
            --     buffer = args.buf,
            --     callback = function()
            --       vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            --     end,
            --   })
            -- end

            -- only attach keymap if lsp is attached
            -- so nvim can do it's default thing otherwise
            local opts = { buffer = args.buf }

            vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
            vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
            vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
            vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
            vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
            vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
            vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
            vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
            vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
            vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
          end,
        })

        require("mason-lspconfig").setup({
          ensure_installed = { "gopls", "html", "templ", "emmet_ls", "hyprls", "templ" },
          handlers = {
            -- this first function is the "default handler"
            -- it applies to every language server without a "custom handler"
            function(server_name)
              require("lspconfig")[server_name].setup({})
            end,
            ["lua_ls"] = function()
              local lspconfig = require("lspconfig")
              lspconfig.lua_ls.setup({
                settings = {
                  Lua = {
                    diagnostics = {
                      globals = { "vim" },
                    },
                  },
                },
              })
            end,
            ["emmet_ls"] = function()
              local lspconfig = require("lspconfig")
              lspconfig.emmet_ls.setup({
                filetypes = { "css", "eruby", "html", "templ", "javascript" },
              })
            end,
            ["ruby_lsp"] = function()
              local lspconfig = require("lspconfig")
              lspconfig.ruby_lsp.setup({
                cmd = { "mise", "x", "--", "ruby-lsp" },
                root_dir = lspconfig.util.root_pattern(
                  "Gemfile",
                  ".ruby-version",
                  ".tool-versions",
                  "mise.toml",
                  ".git"
                ),
                init_options = {
                  enabledFeatures = {
                    indexing = true,
                  },
                },
              })
            end,
          },
        })
      end,
    },
  },
}

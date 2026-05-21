-- config file at ~/.local/share/db_ui/connections.json
return {
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
        },
        keys = {
            { "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
            vim.api.nvim_set_hl(0, 'NotificationInfo', { fg = "#8A8A8A", bg = "#201D1D" })
            vim.api.nvim_set_hl(0, 'NotificationWarning', { fg = "#FFA066", bg = "#201D1D" })
            vim.api.nvim_set_hl(0, 'NotificationError', { fg = "#FF5D62", bg = "#201D1D" })
        end,

    }
}

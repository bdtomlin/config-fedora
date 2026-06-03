-- this is called by the tmux-nvim-scrollback script in the bin directory
-- which gets invoked by a .zshrc keymapping ^B

vim.api.nvim_create_user_command("TerminalScrollback", function(args)
  vim.opt.wrap = true
  vim.opt.relativenumber = false
  vim.opt.cmdheight = 0
  vim.opt.laststatus = 0
  vim.opt.nu = false
  vim.opt.signcolumn = "no"
  vim.keymap.set("n", "q", "<cmd>q!<cr>")
  vim.keymap.set("n", "i", "<cmd>q!<cr>")
  vim.keymap.set("n", "a", "<cmd>q!<cr>")
  vim.keymap.set("n", "o", "<cmd>q!<cr>")
  vim.keymap.set("n", "O", "<cmd>q!<cr>")

  -- local function error_message()
  --   vim.api.nvim_err_writeln("Can't modify scrollback")
  -- end

  -- vim.keymap.set("n", "i", function()
  --   error_message()
  -- end)
  -- vim.keymap.set("n", "a", function()
  --   error_message()
  -- end)
  -- vim.keymap.set("n", "o", function()
  --   error_message()
  -- end)
  -- vim.keymap.set("n", "O", function()
  --   error_message()
  -- end)

  local buf = vim.api.nvim_get_current_buf()
  local b = vim.api.nvim_create_buf(false, true)
  local chan = vim.api.nvim_open_term(b, {})
  vim.api.nvim_chan_send(chan, table.concat(vim.api.nvim_buf_get_lines(buf, 0, -1, false), "\n"))
  vim.api.nvim_win_set_buf(0, b)
  vim.cmd(":bd! #")
  vim.cmd("normal! G")
  vim.cmd("normal! 0")

  vim.defer_fn(function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.fn.col(".") - 1 -- 1-based column converted to 0-based
    local byte_index = vim.str_byteindex(line, col) -- Get the byte index for the UTF-8 character
    local char = vim.fn.strcharpart(line, byte_index, 1) -- Extract the Unicode character

    if char ~= "❯" then
      vim.cmd([[?❯$]])
      vim.cmd("noh")
    end
  end, 100)
end, {})

vim.pack.add({
  "https://github.com/chentoast/marks.nvim",
})

local marks_loaded = false

local function load_marks()
  if marks_loaded then
    return
  end

  vim.cmd.packadd("marks.nvim")
  require("marks").setup({})
  marks_loaded = true
end

-- Load when you first use any mark command
vim.keymap.set("n", "m", function()
  load_marks()
  vim.fn.feedkeys("m", "n")
end, { silent = true })

vim.keymap.set("n", "'", function()
  load_marks()
  vim.fn.feedkeys("'", "n")
end, { silent = true })

vim.keymap.set("n", "`", function()
  load_marks()
  vim.fn.feedkeys("`", "n")
end, { silent = true })

-- Optional: Load when using :Marks command
vim.api.nvim_create_user_command("Marks", function()
  load_marks()
  vim.cmd("Marks")
end, {})

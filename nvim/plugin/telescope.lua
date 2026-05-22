-- telescope.nvim + plenary (built-in pack manager)
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

local telescope_loaded = false

local function load_telescope()
  if telescope_loaded then
    return
  end

  vim.cmd.packadd("plenary.nvim")
  vim.cmd.packadd("telescope.nvim")

  require("telescope").setup({
    defaults = {
      vimgrep_arguments = {
        "rg", "--color=never", "--no-heading", "--with-filename",
        "--line-number", "--column", "--case-sensitive", "--hidden",
        "--glob=!.git/",
      },
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = { prompt_position = "top" },
    },
    pickers = {
      buffers = { initial_mode = "normal", mappings = { n = { ["d"] = "delete_buffer" } } },
      marks   = { initial_mode = "normal", mappings = { n = { ["d"] = "delete_mark" } } },
      registers = { initial_mode = "normal" },
    },
  })

  telescope_loaded = true
end

-- === Keymaps ===
vim.keymap.set("n", "<leader><leader>", function()
  load_telescope()
  vim.cmd("Telescope")        -- This now works safely
end, { desc = "Telescope", silent = true })

vim.keymap.set("n", "<leader>ff", function()
  load_telescope()
  require("telescope.builtin").find_files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fc", function()
  load_telescope()
  require("telescope.builtin").commands()
end, { desc = "Telescope commands" })

vim.keymap.set("n", "<leader>fg", function()
  load_telescope()
  require("telescope.builtin").live_grep()
end, { desc = "Live Grep" })

vim.keymap.set("n", "<leader>fG", function()
  load_telescope()
  require("telescope.builtin").git_files()
end, { desc = "Telescopt git files" })

vim.keymap.set("n", "<leader>fb", function()
  load_telescope()
  require("telescope.builtin").buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fh", function()
  load_telescope()
  require("telescope.builtin").command_histor()
end, { desc = "Telescope command history" })

vim.keymap.set("n", "<leader>fm", function()
  load_telescope()
  require("telescope.builtin").marks()
end, { desc = "Telescope marks" })

vim.keymap.set("n", '<leader>f"', function()
  load_telescope()
  require("telescope.builtin").registers()
end, { desc = "Telescope registers" })

vim.keymap.set("n", "<leader>gs", function()
  load_telescope()
  require("telescope.builtin").git_status()
end, { desc = "Telescope git status" })


-- vim-wordmotion (using built-in pack manager)
vim.pack.add({
  "https://github.com/chaoren/vim-wordmotion",
})

-- Configuration (equivalent to `init = function()` in lazy.nvim)
-- Set these BEFORE the plugin loads
vim.g.wordmotion_uppercase_spaces = {
  ".",
  ":",
  '"',
  "'",
  ",",
  ";",
  "(",
  ")",
  "[",
  "]",
  "{",
  "}",
}

-- Optional: change the prefix (uncomment if you want <A-w>)
-- vim.g.wordmotion_prefix = "<A-w>"

-- Load the plugin (you can make it lazy if you want)
vim.cmd.packadd("vim-wordmotion")


-- one_two_three:four-five-six
-- oneftwofthree
-- one-two-three
-- OneTwoThree
-- One Two Three
-- (OneTwo)Three

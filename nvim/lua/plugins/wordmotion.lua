return {
  {
    "chaoren/vim-wordmotion",
    init = function()
      -- vim.g.wordmotion_uppercase_spaces = { ".", ":", '"', "'", ",", "(", ")", "[", "]", "{", "}" }
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
      -- vim.g.wordmotion_prefix = "<a-w>"
    end
  }
}

-- one_two_three:four-five-six
-- oneftwofthree
-- one-two-three
-- OneTwoThree
-- One Two Three
-- (OneTwo)Three

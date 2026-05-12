return {
  {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
      require("alpha").setup(require("btomlin.alphatheme").config)
    end,
  },
}

vim.pack.add({
  "https://github.com/rust-lang/rust.vim",
})

vim.keymap.set("n", "<leader>rr", ":Cargo run<CR>G", { desc = "Cargo Run Rust code" })
vim.keymap.set("n", "<leader>rt", ":Cargo test<CR>G", { desc = "Cargo Run Rust tests" })

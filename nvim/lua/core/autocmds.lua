vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})

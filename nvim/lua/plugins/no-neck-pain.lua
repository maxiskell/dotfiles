return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  keys = {
    { "<leader>nn", "<cmd>NoNeckPain<CR>" },
  },
  config = function()
    require("no-neck-pain").setup({
      buffers = {
        scratchPad = {
          -- set to `false` to
          -- disable auto-saving
          enabled = true,
          -- set to `nil` to default
          -- to current working directory
          location = "~/notes/",
        },
        bo = {
          filetype = "md",
        },
      },
    })
  end,
}

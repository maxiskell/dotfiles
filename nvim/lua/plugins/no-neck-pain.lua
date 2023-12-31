require('no-neck-pain').setup({
  buffers = {
    scratchPad = {
      -- set to `false` to
      -- disable auto-saving
      enabled = true,
      -- set to `nil` to default
      -- to current working directory
      location = '~/notes/',
    },
    bo = {
      filetype = 'md',
    },
  },
})
vim.api.nvim_set_keymap('n', '<leader>nn', '<cmd>NoNeckPain<CR>', { noremap = true })

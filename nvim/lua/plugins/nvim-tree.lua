-- strongly advised by the plugin docs
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  renderer = {
    icons = {
      show = {
        file = false,
      },
      glyphs = {
        git = {
          untracked = '✹',
        },
      },
    },
  },
})

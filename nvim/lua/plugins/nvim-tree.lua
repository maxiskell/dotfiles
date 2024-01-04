return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
  },
  config = function()
    -- strongly advised by the plugin docs
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
      vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "S", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
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
              untracked = "✹",
            },
          },
        },
      },
    })
  end,
}

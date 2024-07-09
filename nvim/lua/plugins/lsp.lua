return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "emmet_ls",
          "eslint",
          "gopls",
          "lua_ls",
          "tsserver",
          "tailwindcss",
          "pyright",
        },
      })

      require("lspconfig").eslint.setup({})
      require("lspconfig").gopls.setup({})
      require("lspconfig").tailwindcss.setup({})
      require("lspconfig").tsserver.setup({})
      require("lspconfig").pyright.setup({})

      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      require("lspconfig").emmet_ls.setup({
        filetypes = {
          "css",
          "html",
          "javascriptreact",
          "sass",
          "scss",
          "typescriptreact",
        },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      })
    end,
  },
}

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup_servers({
  "emmet_ls",
  "eslint",
  "gopls",
  "lua_ls",
  "tsserver",
})

lsp.set_preferences({
  sign_icons = {},
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local k = vim.keymap

  k.set("n", "<leader>k", function()
    vim.lsp.buf.hover()
  end, opts)
  k.set("n", "<leader>sh", function()
    vim.lsp.buf.signature_help()
  end, opts)
  k.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)

  k.set("n", "<leader>j", function()
    vim.diagnostic.open_float()
  end, opts)
  k.set("n", "<leader>D", function()
    vim.diagnostic.setloclist()
  end, opts)
  k.set("n", "]d", function()
    vim.diagnostic.goto_next()
  end, opts)
  k.set("n", "[d", function()
    vim.diagnostic.goto_prev()
  end, opts)
end)

lsp.setup()

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.emmet_ls.setup({
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "svelte",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
})

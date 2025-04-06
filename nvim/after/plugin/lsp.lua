vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable({
  "astro",
  "eslint",
  "gopls",
  "lua_ls",
  "prismals",
  "pyright",
  "tailwindcss",
  "vtsls",
})

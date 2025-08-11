return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        prisma = { "prettierd" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
    })
  end,
}

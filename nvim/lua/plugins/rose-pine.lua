return {
  "rose-pine/neovim",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "dawn",
      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },
    })
    vim.cmd([[colorscheme rose-pine]])
  end,
}

return {
  "rose-pine/neovim",
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },
    })
  end,
}

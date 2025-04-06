return {
  "saghen/blink.cmp",
  -- use a release tag to download pre-built binaries
  version = "1.*",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      lazy = true,
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
  opts = {
    keymap = { preset = "default" },
    snippets = { preset = "luasnip" },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      documentation = { auto_show = false },
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}

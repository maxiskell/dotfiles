return {
  "gbprod/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nord").setup({
      styles = {
        comments = { italic = false, bold = false },
        keywords = { italic = false, bold = false },
        functions = { italic = false, bold = false },
        variables = { italic = false, bold = false },
      },

      on_highlights = function(hl, c)
        for _, group in pairs(hl) do
          group.bold = false
          group.italic = false
        end

        hl.StatusLine = {
          fg = c.snow_storm.origin,
          bg = c.polar_night.bright,
        }

        hl.StatusLineNC = {
          fg = c.snow_storm.origin,
          bg = c.polar_night.origin,
        }

        hl.TabLine = {
          fg = c.polar_night.light,
          bg = c.polar_night.bright,
        }

        hl.TabLineSel = {
          fg = c.snow_storm.origin,
          bg = c.polar_night.origin,
        }
      end,
    })
    vim.cmd.colorscheme("nord")
  end,
}

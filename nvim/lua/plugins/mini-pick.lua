return {
  "echasnovski/mini.pick",
  config = function()
    require("mini.pick").setup()
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("mini.pick").builtin.files()
      end,
      desc = "[F]ind [F]iles",
    },
    {
      "<leader>fg",
      function()
        require("mini.pick").builtin.grep_live()
      end,
      desc = "[F]ind [G]rep",
    },
    {
      "<leader>fh",
      function()
        require("mini.pick").builtin.help()
      end,
      desc = "[F]ind [H]elp",
    },
    {
      "<leader>fb",
      function()
        require("mini.pick").builtin.buffers()
      end,
      desc = "[F]ind [B]uffer(s)",
    },
    {
      "<leader>fr",
      function()
        require("mini.pick").builtin.resume()
      end,
      desc = "[F]ind [R]esume",
    },
    {
      "<leader>fw",
      function()
        local pick = require("mini.pick")
        local word = vim.fn.expand("<cword>")
        pick.builtin.grep({ pattern = word })
      end,
      desc = "[F]ind current [W]ord",
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "[F]ind [F]iles",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "[F]ind using [G]rep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "[F]ind [B]uffer(s)",
    },
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "[/] Fuzzy find in current buffer",
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "[F]ind curent [W]ord",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "[F]ind [H]elp",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      desc = "[F]ind [D]efinition(s)",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "[F]ind [R]eferences",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    local lsp_settings = {
      theme = "ivy",
      initial_mode = "normal",
      path_display = { "smart" },
    }

    telescope.setup({
      defaults = {
        dynamic_preview_title = true,
        mappings = {
          n = {
            ["t"] = actions.select_tab,
            ["s"] = actions.select_vertical,
            ["h"] = actions.select_horizontal,
            ["d"] = actions.delete_buffer,
          },
          i = {
            ["<c-a>"] = actions.select_all,
          },
        },
      },
      pickers = {
        find_files = {
          previewer = false,
        },
        buffers = {
          previewer = false,
          theme = "dropdown",
          initial_mode = "normal",
        },
        live_grep = { path_display = { "hidden" } },
        lsp_definitions = lsp_settings,
        lsp_implementations = lsp_settings,
        lsp_references = lsp_settings,
      },
    })

    telescope.load_extension("fzf")
  end,
}

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
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
      "<leader>fD",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "[F]ind in [D]iagnostics",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "[F]ind [R]eferences",
    },
    {
      "<leader>fe",
      function()
        require("telescope").extensions.file_browser.file_browser()
      end,
      desc = "[F]ile [E]xplorer",
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
        prompt_prefix = " ",
        selection_caret = " ",
        dynamic_preview_title = true,
        mappings = {
          n = {
            ["t"] = actions.select_tab,
            ["s"] = actions.select_vertical,
            ["h"] = actions.select_horizontal,
            ["d"] = actions.delete_buffer,
          },
          i = {
            ["<c-k>"] = actions.move_selection_previous,
            ["<c-j>"] = actions.move_selection_next,
            ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
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
      extensions = {
        file_browser = {
          theme = "ivy",
          initial_mode = "normal",
          mappings = {
            n = {
              ["h"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
            },
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
  end,
}

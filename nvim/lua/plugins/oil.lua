return {
  "stevearc/oil.nvim",
  keys = {
    { "<leader>e", "<cmd>Oil --float .<cr>" },
  },
  config = function()
    require("oil").setup({
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "n",
      },
      default_file_explorer = true,
      restore_win_options = true,
      skip_confirm_for_simple_edits = false,
      delete_to_trash = true,
      prompt_save_on_select_new_entry = true,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<cr>"] = "actions.select",
        ["or"] = "actions.select_vsplit",
        ["od"] = "actions.select_split",
        ["ot"] = "actions.select_tab",
        ["<esc>"] = "actions.close",
        ["<c-p>"] = "actions.preview",
        ["<c-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,
      view_options = {
        show_hidden = false,
        is_hidden_file = function(name)
          return vim.startswith(name, ".")
        end,
      },
      float = {
        padding = 2,
        max_width = 100,
        max_height = 25,
        border = "rounded",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    })
  end,
}

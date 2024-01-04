return {
  "lewis6991/gitsigns.nvim",
  cmd = "Gitsigns",
  init = function()
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("load_gitsigns", { clear = false }),
      callback = function()
        if package.loaded["gitsigns"] then
          vim.api.nvim_clear_autocmds({ group = "load_gitsigns" })

          return true
        end

        vim.api.nvim_call_function("system", {
          "git -C " .. vim.api.nvim_call_function("expand", { "%:p:h" }) .. " rev-parse",
        })

        if vim.api.nvim_get_vvar("shell_error") ~= 0 then
          return
        end

        vim.api.nvim_clear_autocmds({ group = "load_gitsigns" })

        require("lazy").load({ plugins = { "gitsigns.nvim" } })
      end,
    })
  end,
  config = function()
    require("gitsigns").setup({
      preview_config = { border = "rounded", row = 1, col = 0 },
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            require("gitsigns").next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            require("gitsigns").prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<leader>hs", require("gitsigns").stage_hunk)
        map("n", "<leader>hr", require("gitsigns").reset_hunk)
        map("v", "<leader>hs", function()
          require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "<leader>hr", function()
          require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "<leader>hS", require("gitsigns").stage_buffer)
        map("n", "<leader>hu", require("gitsigns").undo_stage_hunk)
        map("n", "<leader>hR", require("gitsigns").reset_buffer)
        map("n", "<leader>hp", require("gitsigns").preview_hunk)
        map("n", "<leader>hb", function()
          require("gitsigns").blame_line({ full = true })
        end)
        map("n", "<leader>tb", require("gitsigns").toggle_current_line_blame)
        map("n", "<leader>hd", require("gitsigns").diffthis)
        map("n", "<leader>hD", function()
          require("gitsigns").diffthis("~")
        end)
        map("n", "<leader>td", require("gitsigns").toggle_deleted)

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    })
  end,
}

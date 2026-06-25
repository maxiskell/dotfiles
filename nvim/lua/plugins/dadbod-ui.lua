return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" },
      lazy = true,
    }, -- Optional
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1

    local dbs = {}
    local env = vim.fn.environ()

    -- load dbs from env, based on "^DB_"-matching values
    for key, val in pairs(env) do
      if key:match("^DB_") and val and val ~= "" then
        table.insert(dbs, {
          name = key:sub(4):lower(),
          url = val,
        })
      end
    end

    vim.g.dbs = dbs
  end,
}

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

    local f = io.open(".env", "r")
    if f then
      for line in f:lines() do
        local key, val = line:match("^([%w_]+)=(.+)$")
        if key and val then
          vim.env[key] = val
        end
      end
      f:close()
    end

    -- Use the loaded env vars
    vim.g.dbs = {
      { name = "dev", url = vim.env.DB_DEV },
      { name = "hydra_local", url = vim.env.DB_HYDRA_LOCAL },
      { name = "prod", url = vim.env.DB_PROD },
    }
  end,
}

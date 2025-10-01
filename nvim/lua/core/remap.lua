vim.g.mapleader = " "

local k = vim.keymap
local cmd = vim.cmd

-- the essentials
k.set("n", "H", "^")
k.set("n", "L", "$")
k.set("n", "<leader>h", cmd.nohlsearch)
k.set("n", "<leader>e", cmd.Explore)

-- split traveler
k.set("n", "<c-h>", "<c-w>h")
k.set("n", "<c-j>", "<c-w>j")
k.set("n", "<c-k>", "<c-w>k")
k.set("n", "<c-l>", "<c-w>l")

-- indent mode
k.set("v", "<", "<gv")
k.set("v", ">", ">gv")

-- handy quit & save
k.set("n", "<leader>w", cmd.w)
k.set("n", "<leader>q", cmd.q)
k.set("n", "<leader>a", cmd.x)

-- center on page navigation
k.set("n", "<c-d>", "<c-d>zz")
k.set("n", "<c-u>", "<c-u>zz")
k.set("n", "<c-f>", "<c-f>zz")
k.set("n", "<c-b>", "<c-b>zz")

-- center on search traveling
k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")

-- keep position on line lifting
k.set("n", "J", "mzJ`z")

-- remove without adding to clipboard
k.set("n", "x", '"_x"')

-- yank to system clipboard
k.set("n", "<leader>y", '"+y')
k.set("v", "<leader>y", '"+y')
k.set("n", "<leader>Y", '"+Y')

-- yank current file path to system clipboard
k.set("n", "<leader>y%", function()
  local filepath = vim.fn.expand("%:p")
  vim.fn.setreg("+", filepath)
  vim.api.nvim_echo({
    { '"', "Normal" },
    { filepath, "Directory" },
    { '" copied to clipboard', "Normal" },
  }, false, {})
end)

-- move selection around
k.set("v", "J", ":m '>+1<cr>gv=gv")
k.set("v", "K", ":m '<-2<cr>gv=gv")

--- Safe quickfix navigation
--- (avoid "no more items" error)
---
---@param command "cnext"|"cprevious"
local function quickfixmove(command)
  local ok = pcall(cmd, command)
  if not ok then
    vim.api.nvim_echo({ { "No more items" } }, false, {})
  else
    vim.api.nvim_echo({ { "" } }, false, {})
  end
end

k.set("n", "<m-j>", function()
  quickfixmove("cnext")
end)
k.set("n", "<m-k>", function()
  quickfixmove("cprevious")
end)

-- we don't need you
k.set("n", "Q", "<nop>")

-- lsp signature while typing
k.set("i", "<C-k>", function()
  vim.lsp.buf.signature_help()
end)

-- lsp diagnostic
k.set("n", "<leader>j", function()
  vim.diagnostic.open_float()
end)
k.set("n", "]d", function()
  vim.diagnostic.goto_next()
end)
k.set("n", "[d", function()
  vim.dignostic.goto_prev()
end)
k.set("n", "<leader>D", function()
  vim.diagnostic.setqflist()
end)

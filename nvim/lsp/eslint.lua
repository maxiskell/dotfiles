local flat_config_files = {
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.cjs",
  "eslint.config.ts",
  "eslint.config.mts",
  "eslint.config.cts",
}

local eslint_root_markers = {
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  ".eslintrc.json",
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.cjs",
  "eslint.config.ts",
  "eslint.config.mts",
  "eslint.config.cts",
  ".git",
}

local fallback_root_markers = {
  "package.json",
  "package-lock.json",
  "yarn.lock",
  "pnpm-lock.yaml",
  "bun.lock",
  "bun.lockb",
  ".git",
}

local function has_flat_config(root_dir)
  if not root_dir or root_dir == "" then
    return false
  end

  for _, config_file in ipairs(flat_config_files) do
    if vim.uv.fs_stat(vim.fs.joinpath(root_dir, config_file)) then
      return true
    end
  end

  return false
end

local function detect_root_dir(bufnr)
  return vim.fs.root(bufnr, eslint_root_markers)
    or vim.fs.root(bufnr, fallback_root_markers)
    or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
    or vim.fn.getcwd()
end

return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro",
  },
  root_markers = eslint_root_markers,
  root_dir = function(bufnr, on_dir)
    on_dir(detect_root_dir(bufnr))
  end,
  before_init = function(_, config)
    local use_flat_config = has_flat_config(config.root_dir)

    config.settings = config.settings or {}
    config.settings.useFlatConfig = use_flat_config
    config.settings.experimental = config.settings.experimental or {}
    config.settings.experimental.useFlatConfig = use_flat_config
    config.settings.workingDirectory = { directory = config.root_dir }
  end,
  settings = {
    validate = "on",
    packageManager = nil,
    useESLintClass = false,
    useFlatConfig = false,
    experimental = {
      useFlatConfig = false,
    },
    codeActionOnSave = {
      enable = false,
      mode = "all",
    },
    format = true,
    quiet = false,
    onIgnoredFiles = "off",
    rulesCustomizations = {},
    run = "onType",
    problems = {
      shortenToSingleLine = false,
    },
    nodePath = "",
    workingDirectory = { mode = "location" },
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = {
        enable = false,
      },
    },
  },
}

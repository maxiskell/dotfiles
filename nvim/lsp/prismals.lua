return {
  cmd = { "prisma-language-server", "--stdio" },
  filetypes = { "prisma" },
  settings = {
    prisma = {
      prismaFmtBinPath = "",
    },
  },
  root_markers = {
    "package.json",
    ".git",
  },
}

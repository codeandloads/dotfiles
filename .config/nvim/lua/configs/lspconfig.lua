require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

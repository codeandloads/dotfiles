local status, lspconfig = pcall(require, "lspconfig")
local util = require("lspconfig/util")
if not status then
  return
end

local cwd = vim.loop.cwd

-- vim.keymap.set('n', '<space>q', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymapset('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts):with:withuu

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
  -- INFO: This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig["pyright"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  root_dir = cwd,
})

lspconfig["gopls"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  root_dir = cwd,
})

lspconfig["ts_ls"].setup({
  filetypes = { "typescript", "typescriptreact" },
  on_attach = on_attach,
  flags = lsp_flags,
  root_dir = cwd,
})

lspconfig["lua_ls"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  root_dir = cwd,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    },
  },
})

lspconfig["clangd"].setup({
  cmd = {
    "clangd",
    "--query-driver=/usr/bin/gcc",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
})

lspconfig["emmet_ls"].setup({
  filetypes = { "html", "typescriptreact" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
})

require'lspconfig'.html.setup{
cmd = { "vscode-html-language-server", "--stdio" },
filetypes = { "html" },
init_options = {
  configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = {
    css = true,
    javascript = true
  }
},
root_dir = cwd,
settings = {},
}


lspconfig["marksman"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
  single_file_support = true,
})

-- configure css server
lspconfig["cssls"].setup({
  filetypes = { "html", "css" },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
-- lspconfig["tailwindcss"].setup({
--   filetypes = { "html", "svelte", "astro", "typescriptreact" },
--   root_dir = util.root_pattern("package.json", ".git"),
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

-- configure bashls server
lspconfig["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure yamlls server
lspconfig["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure jsonls server
lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure dotenv server
lspconfig["dockerls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- rust analyzer
lspconfig["rust_analyzer"].setup({
  root_dir = cwd,
  cmd = { "rust-analyzer" },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- local function lsp_highlight_document(client)
-- 	-- Set autocommands conditional on server_capabilities
-- 	local status_ok, illuminate = pcall(require, "illuminate")
-- 	if not status_ok then
-- 		return
-- 	end
-- 	illuminate.on_attach(client)
-- 	-- end
-- end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 2, prefix = "" },
  severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    source = "always", -- Or "if_many"
    focusable = false,
    style = "minimal",
    border = "rounded",
    header = "",
    prefix = "",
  },
})

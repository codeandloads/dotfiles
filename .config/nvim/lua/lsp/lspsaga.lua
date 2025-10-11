local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

local keymap = vim.keymap

saga.setup {
  symbol_in_winbar = {
    enable = true,
    separator = "-",
    ignore_patterns = {},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  lightbulb = {
    enable = false,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
}

local opts = { noremap = true, silent = true }
keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
keymap.set("n", "gD", "<Cmd>Lspsaga goto_type_definition<CR>", opts)
keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
keymap.set("n", "<leader>r", "<Cmd>Lspsaga rename<CR>", opts)

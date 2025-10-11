local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  "windwp/nvim-autopairs",
  "nvim-lua/plenary.nvim",
  "nvimtools/none-ls.nvim",
  "nvimtools/none-ls-extras.nvim",
  "norcalli/nvim-colorizer.lua",
  "akinsho/toggleterm.nvim",
  "numToStr/Comment.nvim", -- comment
  "JoosepAlviste/nvim-ts-context-commentstring",
  "p00f/clangd_extensions.nvim",
  "RRethy/vim-illuminate",
  "lewis6991/impatient.nvim",
  "onsails/lspkind.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-nvim-lua",
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  "nvim-treesitter/nvim-treesitter",
  "kylechui/nvim-surround",
  "ggandor/leap.nvim",
  {
    "m-demare/hlargs.nvim",
    requires = { "nvim-treesitter/nvim-treesitter" },
  },
  "christoomey/vim-tmux-navigator",
  "neovim/nvim-lspconfig",
  "glepnir/lspsaga.nvim",
  "simrat39/rust-tools.nvim",
  "mfussenegger/nvim-dap",
  {
    "L3MON4D3/LuaSnip",
    wants = { "friendly-snippets", "vim-snippets" },
  },
  "rafamadriz/friendly-snippets",
  "honza/vim-snippets",
  "saadparwaiz1/cmp_luasnip",
  --gitsign
  "lewis6991/gitsigns.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
  },
  { "ellisonleao/gruvbox.nvim" },
  { "wuelnerdotexe/vim-astro" },
  {
    "ibhagwan/fzf-lua",
  },
  "nvim-lualine/lualine.nvim",
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  "nvim-tree/nvim-web-devicons",
  { "ellisonleao/gruvbox.nvim" },
  -- using lazy.nvim
  { "akinsho/bufferline.nvim", version = "*" },
  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
}

local opts = {}
require("lazy").setup(plugins, opts)

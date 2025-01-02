return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "plasticboy/vim-markdown",
    ft = { "markdown" },
    config = function()
      -- Optional configuration
      vim.g.vim_markdown_math = 1 -- Enable math support
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" }, -- Load only for Markdown files
    build = "cd app && npm install", -- Install dependencies
    config = function()
      vim.g.mkdp_auto_start = 1 -- Auto start preview when opening Markdown files
    end,
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

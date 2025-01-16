return {
  {
    -- Sometimes, we just need to make sure that
    -- our programming lanaguages are present and accounted for.
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- uncomment for format on save
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
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      -- "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim",
    },
  },
  -- Add debugger plugins
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap", -- Already inc above.
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- ~~~~~? Review from here
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end
      dap.listeners.after.event_terminated["keep-session"] = function()
        print "Program ended, keeping session alive"
      end
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        type = "python",
        request = "launch",
        name = "Launch File",
        program = "${file}",
        console = "integratedTerminal",
        stopOnEntry = false,
      }
      -- ~~~~~? Review to here
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "c",
        "cpp",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp", -- Specify the plugin to override
    opts = function(_, opts)
      local cmp = require "cmp"
      -- opts.mapping["<C-y"] = cmp.mapping.confirm { select = true }
      opts.mapping = cmp.mapping.preset.insert {
        ["<C-y>"] = cmp.mapping.confirm { select = false },
      }
      opts.mapping = cmp.mapping.preset.cmdline {
        ["<C-y>"] = cmp.mapping.confirm { select = false },
      }
      return opts
    end,
  },
}

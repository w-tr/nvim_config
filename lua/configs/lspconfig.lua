-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local configs = require "nvchad.configs.lspconfig"

-- Overwrite the nvchad.configs.lspconfig deets
require "custom.lspconfig"
-- Recipe provided by https://nvchad.com/docs/recipes
local servers = {
  html = {},
  awk_ls = {},
  bashls = {},
  lua_ls = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end

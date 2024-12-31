local vim = vim
local x = vim.diagnostic.severity

vim.diagnostic.config {
  virtual_text = {
    -- prefix = "", -- Keep the symbol
    format = function(diagnostic)
      return nil -- Removes the diagnostic message text
    end,
  },
  -- signs = true, -- Keeps diagnostic signs in the gutter
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
  underline = true,
  update_in_insert = false,
}

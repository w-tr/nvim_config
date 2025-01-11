require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

-- ##########
-- # Addressing nvchad mappings
-- ##########
-- I'm never going to get rid of linenumber, so mapping is pointless.
unmap("n", "<leader>n")
-- I do not want a to :editnew, normally I'd open with :e filename or :sav new_filename.
unmap("n", "<leader>b")
-- fm was used to format, I'll use it for find marks and remap format to =
unmap("n", "<leader>fm")

map("n", "<leader>=", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General format file" })

unmap("n", "<leader>ma")
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" })

-- Is there a way to only add these if i'm in a buffer
-- that allows dap? Atm only python?
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Debug Breakpoint toggle" })
map("n", "<leader>drp", function()
  require("dap-python").test_method()
end, { desc = "Dap Run Python" })

-- TODO - Understand existing commands
--  1. Telescope keymaps returns 120 instances
--  2. Which key returns x
--
-- TODO - Add funct to chatGPT
-- It turns out the chatgpt dialog popup window doesn't have nvchad j mapping, which is to say
-- j = gj when line is wrapped.
--
--
--
-- TODO: Add git stuff,
-- 1. Telescope has git stuff.
--     unmap("n", "<leader>gt")
--     unmap("n", "<leader>pt")
-- 2. Gitsigns has git stuff.
--     goto next hunk etc
--     M.gitsigns = {
--       plugin = true,
--

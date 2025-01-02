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

-- TODO
-- FIXME
--
-- TODO: Lets add something to the telescope git stuff.
-- unmap("n", "<leader>gt")
-- unmap("n", "<leader>pt")
--
-- TODO: Git stuff which expands on gitsigns
-- goto next hunk etc
--
-- M.gitsigns = {
  -- plugin = true,
-- --j
--
-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

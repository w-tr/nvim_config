require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt
o.cursorlineopt ='both' -- to enable cursorline!

-- Add some options, that i had from when i tried kickstarter
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', eol = '↵' }
opt.scrolloff = 2

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Hide the built-in bars. AstroNvim sets `laststatus = 3` and `showtabline = 2`,
-- which would make Neovim render default bars now that heirline no longer
-- provides the statusline/tabline (see `lua/plugins/heirline.lua`).
vim.opt.laststatus = 0
vim.opt.showtabline = 0

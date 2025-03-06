vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

-- Set up indentation for Makefiles
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    -- Set tab width to 4 spaces
    vim.opt_local.tabstop = 4
    -- Set shiftwidth to 4 spaces
    vim.opt_local.shiftwidth = 4
  end,
})

-- Create a BufLeave autocmd to reset settings when leaving Makefile buffers
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*/Makefile",
  callback = function()
    vim.opt_local.tabstop = 2       -- Your default tab size
    vim.opt_local.shiftwidth = 2    -- Your default shift width
  end,
})

vim.schedule(function()
  require "mappings"
end)

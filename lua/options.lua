require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.cmd("syntax off")
vim.cmd([[let g:rails_projections = {
\ "app/api/*.rb": {
\   "command": "api",
\   "test": [
\     "spec/requests/{}_spec.rb"
\   ],
\ },
\ "packages/*/lib/engine.rb": {
\   "command": "package",
\ }}
]])

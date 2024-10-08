require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("n", "<leader>s", "<cmd> w <CR>", {desc = "Save file"})
map("n", "<leader><leader>", "<cmd> NvimTreeToggle <CR>", {desc = "NvimTreeToggle"})
map("n", "<leader>gs", "<cmd> Telescope git_status <CR>", {desc = "Git status"})
map("n", "<C-n>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto prev" })

map("n", "<C-p>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

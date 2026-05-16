-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "<C-E>", "<C-X><C-E>")
vim.keymap.set("i", "<C-Y>", "<C-X><C-Y>")
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

local function get_explorer_dir()
  local explorer = Snacks.picker.get({ source = "explorer" })[1]

  if not explorer then
    return vim.fn.getcwd()
  end

  return explorer:dir()
end

vim.keymap.set("n", "<leader>fd", function()
  Snacks.picker.files({
    cwd = get_explorer_dir(),
    hidden = true,
  })
end, {
  desc = "Find files in selected directory",
})

vim.keymap.set("n", "<leader>fs", function()
  Snacks.picker.grep({
    cwd = get_explorer_dir(),
    hidden = true,
  })
end, {
  desc = "Grep in selected directory",
})

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>gr', ':grep "<C-r><C-w>" app/')
vim.keymap.set('n', '<leader>cr', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
  print("Relative path copied to clipboard")
end, { desc = "Copy relative file path to clipboard" })

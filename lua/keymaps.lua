vim.g.mapleader = " "

vim.keymap.set('n', '<leader>gr', ':grep "<C-r><C-w>" app/')
vim.keymap.set('n', '<leader>cr', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
  print("Relative path copied to clipboard")
end, { desc = "Copy relative file path to clipboard" })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Move to left pane" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Move to below pane" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Move to above pane" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Move to right pane" })

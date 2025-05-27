-- ~/.config/nvim/lua/plugins/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
    require 'nvim-tree'.setup {
      disable_netrw       = true,
      hijack_netrw        = true,
      open_on_tab         = false,
      hijack_cursor       = false,
      update_cwd          = true,
      update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
      },
      system_open         = {
        cmd  = nil,
        args = {}
      },
      view                = {
        width = 30,
        side = 'left'
      },
      git = {
        ignore = false,
      }
    }

    vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end
}

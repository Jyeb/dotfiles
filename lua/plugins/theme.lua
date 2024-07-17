return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = false
    -- custom options here
  },
  config = function(_, opts)
    require("tokyonight").setup(opts) -- calling setup is optional
    vim.cmd [[colorscheme tokyonight]]
  end,
}

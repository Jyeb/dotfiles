return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "ruby", "lua", "javascript", "html", "bash" },
      highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true
      },
    }
  end
}


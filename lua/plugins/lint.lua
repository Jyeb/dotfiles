return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      ruby = { 'rubocop' },
      javascript = { 'eslint' },
      html = { 'tidy' },
      bash = { 'shellcheck' }
    }

    -- vim.api.nvim_create_autocmd('BufWritePost', {
    --   callback = function()
    --     -- lint.try_lint()
    --   end,
    --   pattern = '*'
    -- })
  end
}

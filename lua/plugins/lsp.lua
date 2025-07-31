return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup {}
      require("lspconfig").ruby_lsp.setup({
        cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
        cmd_env = {
          RAILS_ENV = "test",
          RUBY_LSP_LOG_LEVEL = "debug"
        },
        init_options = {
          formatter = 'standard',
          linters = { 'standard' },
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            }
          }
        },
        on_attach = function(client, bufnr)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
        end,
      })

      require("lspconfig").sorbet.setup({
        cmd = { "srb", "tc", "--lsp" },
        on_attach = function(client, bufnr)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
        end,
      })
    end,
  }
}

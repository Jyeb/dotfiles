return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "solargraph", "ruby_lsp" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        init_options = {
          formatter = {
            rubocop = {
              command = "bundle", -- Use bundled rubocop
              args = { "exec", "rubocop" },
            }
          },
          diagnostics = {
            rubocop = {
              command = "bundle", -- Use bundled rubocop
              args = { "exec", "rubocop" },
            }
          }
        }
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

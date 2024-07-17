return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- Define a function to check for the presence of rubocop-minitest
    local function has_rubocop_minitest()
      local handle = io.popen("bundle show rubocop-minitest")
      local result = handle:read("*a")
      handle:close()
      return result ~= ""
    end

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rubocop.with({
          command = "bundle",
          args = vim.list_extend(
            { "exec", "rubocop" },
            null_ls.builtins.formatting.rubocop._opts.args
          ),
          condition = function(utils)
            return utils.root_has_file({ "Gemfile", ".rubocop.yml" }) and has_rubocop_minitest()
          end,
        }),
        null_ls.builtins.diagnostics.rubocop.with({
          command = "bundle",
          args = vim.list_extend(
            { "exec", "rubocop" },
            null_ls.builtins.diagnostics.rubocop._opts.args
          ),
          condition = function(utils)
            return utils.root_has_file({ "Gemfile", ".rubocop.yml" }) and has_rubocop_minitest()
          end,
        }),
      },
    })
  end,
}

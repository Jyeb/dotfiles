return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      vim.api.nvim_set_keymap(
        "n",
        "<leader>gt",
        ":Gitsigns toggle_current_line_blame<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.keymap.set("n", "<leader>b", ":GitBlameOpenCommitURL<CR>", { desc = "Open Git Blame Commit URL" })
      vim.g.gitblame_display_virtual_text = 0
      vim.g.gitblame_date_format = "%b %d, %Y"
      vim.g.gitblame_message_template = "<author> • <date>"
    end,
  },
}

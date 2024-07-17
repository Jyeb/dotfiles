return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	requires = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				live_grep_args = {
					auto_quoting = true,
				},
			},
		})
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "live_grep_args")

		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
		keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
		keymap("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
	end,
}

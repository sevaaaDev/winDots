local M = {
	"nvim-telescope/telescope.nvim",
	commit = "40c31fdde93bcd85aeb3447bb3e2a3208395a868",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true, commit = "50012918b2fc8357b87cff2a7f7f0446e47da174" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		{ "debugloop/telescope-undo.nvim", commit = "13c33c173e53f14df7eec5155c52a3d2ab022d8d" },
		{ "nvim-tree/nvim-web-devicons", lazy = true, commit = "3af745113ea537f58c4b1573b64a429fefad9e07" },
	},
}

function M.config()
	require("telescope").load_extension("undo")
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>fp", builtin.find_files, { desc = "[F]ile [P]ickers" })
	vim.keymap.set("n", "<leader>fgp", builtin.live_grep, { desc = "[F]ind using [G]rep" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
	vim.keymap.set("n", "<leader>f?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
	vim.keymap.set("n", "<leader>fgi", builtin.git_files, { desc = "Find [G]it [F]iles" })
	vim.keymap.set("n", "<leader>fu", ":Telescope undo theme=ivy<cr>", { desc = "[U]ndo Tree" })
	local actions = require("telescope.actions")
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },
			file_ignore_patterns = { ".git/", "node_modules", ".git\\" },
			mappings = {
				i = {
					["<Down>"] = actions.move_selection_next,
					["<Up>"] = actions.move_selection_previous,
					["<C-n>"] = actions.move_selection_next,
					["<C-p>"] = actions.move_selection_previous,
				},
			},
		},
		pickers = {
			find_files = {
				theme = "ivy",
			},
			buffers = {
				theme = "ivy",
			},
		},
		extensions = {
			undo = {},
		},
	})
end

return M

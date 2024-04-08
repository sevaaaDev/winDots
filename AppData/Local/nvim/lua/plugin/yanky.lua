return {
	"gbprod/yanky.nvim",
	config = function()
		local utils = require("yanky.utils")
		require("yanky").setup({
			preserve_cursor_position = {
				enabled = true,
			},
			ring = {
				history_length = 100,
				storage = "shada",
				sync_with_numbered_registers = true,
				cancel_event = "update",
				ignore_registers = { "_" },
				update_register_on_cycle = false,
			},
			system_clipboard = {
				sync_with_ring = true,
			},
			picker = {
				select = {
					action = require("yanky.picker").actions.set_register(utils.get_default_register()),
				},
			},
			highlight = {
				on_put = false,
				on_yank = false,
				timer = 500,
			},
		})
		-- Yanky keymaps --
		vim.keymap.set({ "n" }, "yr", ":YankyRingHistory<cr>")
		vim.keymap.set({ "n" }, "yc", ":YankyClearHistory<cr>")
		vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
	end,
	dependencies = {
		{
			"stevearc/dressing.nvim",
			opts = {
				select = {
					-- Set to false to disable the vim.ui.select implementation
					enabled = true,

					-- Priority list of preferred vim.select implementations
					backend = { "builtin", "fzf_lua", "fzf", "telescope", "nui" },
				},
			},
		},
	},
}

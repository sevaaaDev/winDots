local M = {
	"ggandor/leap.nvim",
	commit = "ff5522a0986cca1bbbeaa4f6d86d23ebf58a025c",
	event = "BufReadPre",
	config = function()
		local leap = require("leap")
		local user = require("leap.user")
		vim.keymap.set({ "n", "o" }, "s", "<Plug>(leap-forward-to)")
		vim.keymap.set({ "n", "o" }, "S", "<Plug>(leap-backward)")
		leap.opts.special_keys.prev_target = "<bs>"
		leap.opts.special_keys.prev_group = "<bs>"
		user.set_repeat_keys("<cr>", "<bs>")
	end,
}

return M

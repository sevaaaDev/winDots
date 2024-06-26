local M = {
	"ggandor/leap.nvim",
	event = "BufReadPre",
	config = function()
		local leap = require("leap")
		local user = require("leap.user")
		vim.keymap.set("n", "L", "<Plug>(leap)")
		leap.opts.special_keys.prev_target = "<bs>"
		leap.opts.special_keys.prev_group = "<bs>"
		leap.opts.max_phase_one_targets = 0
		leap.opts.safe_labels = {}
		user.set_repeat_keys("<cr>", "<bs>")
		-- Hide the (real) cursor when leaping, and restore it afterwards.
		vim.api.nvim_create_autocmd("User", {
			pattern = "LeapEnter",
			callback = function()
				vim.cmd.hi("Cursor", "blend=100")
				vim.opt.guicursor:append({ "a:Cursor/lCursor" })
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "LeapLeave",
			callback = function()
				vim.cmd.hi("Cursor", "blend=0")
				vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
			end,
		})
	end,
}

return M

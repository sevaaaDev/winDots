local M = {
	"folke/which-key.nvim",
	commit = "5224c261825263f46f6771f1b644cae33cd06995",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
}

function M.config()
	local wk = require("which-key")
	wk.setup({})
	wk.register({ l = { name = "LSP" }, f = { name = "File" }, g = { name = "Git" } }, { prefix = "<leader>" })
end

return M

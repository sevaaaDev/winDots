return {
	"uga-rosa/ccc.nvim",
	event = "BufEnter *.css",
	config = function()
		local ccc = require("ccc")
		ccc.setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})
	end,
}

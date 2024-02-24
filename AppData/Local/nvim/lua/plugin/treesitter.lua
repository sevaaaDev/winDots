local M = {
	"nvim-treesitter/nvim-treesitter",
	commit = "226c1475a46a2ef6d840af9caa0117a439465500",
	event = "BufReadPost",
	build = ":TSUpdate",
}

function M.config()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true },
	})
end

return M

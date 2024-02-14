local M = {
	"stevearc/conform.nvim",
	commit = "3f8927532bc8ce4fc4b5b75eab1bf8f1fc83f6b9",
	opts = {},
}

function M.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettierd", "prettier" } },
			html = { { "prettierd", "prettier" } },
			css = { { "prettierd", "prettier" } },
			sh = { "shfmt" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
		notify_on_error = true,
	})
end

return M

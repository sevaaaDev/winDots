return {
	"b0o/incline.nvim",
	commit = "a03020c920a55b75d82ac54c9da18cbf52e8c4d8",
	event = "BufEnter",
	config = function()
		require("incline").setup({
			window = {
				padding = 0,
				margin = { horizontal = 0 },
			},
			render = function(props)
				local num = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
				return {
					{ " TotalBuf ", gui = "bold" },
					{ " " .. num .. " ", guibg = "#74c7ec", guifg = "black" },
					guibg = "#45475a",
					guifg = "white",
				}
			end,
		})
	end,
}

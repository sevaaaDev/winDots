local M = {
	"kylechui/nvim-surround",
	commit = "1c2ef599abeeb98e40706830bcd27e90e259367a",
	event = "BufReadPre",
	config = function()
		require("nvim-surround").setup({
			keymaps = {
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "ys",
				normal_cur = "yss",
				normal_line = false,
				normal_cur_line = false,
				visual = "<Leader>s",
				visual_line = false,
				delete = "ds",
				change = "cs",
				change_line = "cS",
			},
			move_cursor = false,
		})
	end,
}

return M

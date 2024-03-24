local M = {
	"lewis6991/gitsigns.nvim",
	commit = "fb9fd5312476b51a42a98122616e1c448d823d5c",
	event = "BufReadPre",
}

M.opts = {
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage Hunk" })
		map("n", "<leader>gr", gs.reset_hunk)
		map("v", "<leader>gs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		-- map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
		map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage Buffer" })
		map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
		-- map('n', '<leader>hR', gs.reset_buffer)
		map("n", "<leader>gp", gs.preview_hunk, { desc = "Git Preview" })
		map("n", "<leader>gB", function()
			gs.blame_line({ full = true })
		end, { desc = "Show blame" })
		map("n", "<leader>glb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
		map("n", "<leader>gdf", gs.diffthis, { desc = "Diff this" })
		map("n", "<leader>gDf", function()
			gs.diffthis("~")
		end, { desc = "Diff this ~" })

		map("n", "<leader>gld", gs.toggle_deleted, { desc = "Toggle deleted" })

		-- Text object
		-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end,
}

return M

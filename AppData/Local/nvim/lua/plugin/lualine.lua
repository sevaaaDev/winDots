local M = {
	"nvim-lualine/lualine.nvim",
	commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63",
	event = "BufEnter",
	enabled = false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true, commit = "3af745113ea537f58c4b1573b64a429fefad9e07" },
		{ "nvim-lua/plenary.nvim", lazy = true, commit = "50012918b2fc8357b87cff2a7f7f0446e47da174" },
	},
}

function M.config()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end
	local function lspName()
		local clients = vim.lsp.get_active_clients()
		local clients_list = {}
		for _, client in pairs(clients) do
			table.insert(clients_list, client.name)
		end
		local name = table.concat(clients_list, ", ")
		return name
	end
	local function fmtname()
		local fmts = require("conform").list_formatters()
		local fmt_list = {}
		for _, fmt in pairs(fmts) do
			table.insert(fmt_list, fmt.name)
		end
		local name = table.concat(fmt_list, ", ")
		return name
	end
	local function buf()
		local num = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
		return "BufOpn : " .. num
	end
	local colors = {
		darkgray = "#1e1e2e",
		black = "#1e1e2e",
		white = "#cdd6f4",
		red = "#f38ba8",
		green = "#a6e3a1",
		blue = "#74c7ec",
		purple = "#ca9ee6",
		gray = "#313244",
		lightgray = "#45475a",
		inactivegray = "#7c6f64",
	}
	local tes = {
		normal = {
			a = { bg = colors.purple, fg = colors.darkgray, gui = "bold" },
			b = { bg = colors.darkgray, fg = colors.purple },
			c = { bg = colors.darkgray, fg = colors.white },
			y = { bg = colors.lightgray, fg = colors.purple },
			z = { bg = colors.purple, fg = colors.black, gui = "bold" },
		},
		insert = {
			a = { bg = colors.blue, fg = colors.darkgray, gui = "bold" },
			b = { bg = colors.darkgray, fg = colors.blue },
			c = { bg = colors.darkgray, fg = colors.white },
			y = { bg = colors.lightgray, fg = colors.blue },
			z = { bg = colors.blue, fg = colors.black, gui = "bold" },
		},
		visual = {
			a = { bg = colors.green, fg = colors.darkgray, gui = "bold" },
			b = { bg = colors.darkgray, fg = colors.green },
			c = { bg = colors.darkgray, fg = colors.white },
			y = { bg = colors.lightgray, fg = colors.green },
			z = { bg = colors.green, fg = colors.black, gui = "bold" },
		},
		replace = {
			a = { bg = colors.red, fg = colors.darkgray, gui = "bold" },
			b = { bg = colors.darkgray, fg = colors.red },
			c = { bg = colors.darkgray, fg = colors.white },
			y = { bg = colors.lightgray, fg = colors.red },
			z = { bg = colors.red, fg = colors.black, gui = "bold" },
		},
		command = {
			a = { bg = colors.gray, fg = colors.darkgray, gui = "bold" },
			b = { bg = colors.darkgray, fg = colors.gray },
			c = { bg = colors.darkgray, fg = colors.white },
			y = { bg = colors.lightgray, fg = colors.gray },
			z = { bg = colors.gray, fg = colors.black, gui = "bold" },
		},
		inactive = {
			a = { bg = colors.inactivegray, fg = colors.lightgray, gui = "bold" },
			b = { bg = colors.inactivegray, fg = colors.lightgray },
			c = { bg = colors.black, fg = colors.lightgray },
		},
	}

	lualine.setup({
		options = {
			component_separators = "|",
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "packer", "NvimTree" },
			theme = tes,
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icon = { "", align = "left" },
					separator = { left = "", right = "" },
					padding = 0,
				},
			},
			lualine_b = {
				"branch",
			},
			lualine_c = {
				"filename",
				{ "filetype", icon_only = true },
				"diagnostics",
			},
			lualine_x = { buf, fmtname, lspName },
		},
	})
end

return M

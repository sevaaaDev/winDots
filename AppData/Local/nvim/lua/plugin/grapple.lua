return {
	"cbochs/grapple.nvim",
	commit = "6d955cb2907fe36b499fc35b93eab68a929a2286",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	opts = {
		scope = "git_branch",
		icons = true,
		quick_select = "werf56789",
		style = "basename",
	},
	keys = {
		{ ";g", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple: Toggle tags menu" },
		{ ";s", "<cmd>Grapple toggle<cr>", desc = "Grapple: Toggle tag" },
		{ ";w", "<cmd>Grapple select index=1<cr>", desc = "Grapple: select tag 1" },
		{ ";e", "<cmd>Grapple select index=2<cr>", desc = "Grapple: select tag 2" },
		{ ";r", "<cmd>Grapple select index=3<cr>", desc = "Grapple: select tag 3" },
		{ ";f", "<cmd>Grapple select index=4<cr>", desc = "Grapple: select tag 4" },
	},
}

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", ";s", function()
			harpoon:list():append()
		end, { desc = "Add to harpoon" })
		vim.keymap.set("n", "<leader>;", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon" })

		vim.keymap.set("n", ";w", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", ";e", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", ";r", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", ";t", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<C-S-N>", function()
		-- 	harpoon:list():next()
		-- end)
	end,
}

local function keymap(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = true
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end
local term_opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- <Remap space as leader key>
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- <File explorer>
keymap("n", "<leader>pv", ":Ex <cr>", { desc = "Open netrw" })

-- <i dont like the default>
keymap("n", "<c-d>", "<c-d>zz", { desc = "down a half screen" })
keymap("n", "<c-u>", "<c-u>zz", { desc = "up a half screen" })

-- Navigating thru word wrapped line
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "resize up" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "resize down" })
keymap("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "resize left" })
keymap("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "resize right" })

-- Navigate buffers
keymap("n", "]b", ":bnext<CR>", { desc = "go right buffers" })
keymap("n", "[b", ":bprevious<CR>", { desc = "go left buffers" })

-- Delete buffers
keymap("n", "<leader>x", ":bd<cr>", { desc = "delete buffer" })

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "move line up" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "move line down" })

-- Easy write file
keymap("n", "<leader>w", ":w<cr>", { desc = "Write File" })

-- <easy Caps A>
keymap("n", "<leader>a", "A", { desc = "Caps A" })

-- tilde
keymap("n", "<leader>s", "~", { desc = "Swap caps like tilde[~]" })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^")
keymap("v", ">", ">gv^")

-- Move text up and down
-- keymap("v", "<c-J>", ":m '>+1<CR>gv=gv", opts)
-- keymap("v", "<c-K>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', { desc = "dont take deleted word to register" })

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
-- keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
-- keymap("x", "<c-J>", ":m '>+1<CR>gv=gv", opts)
-- keymap("x", "<c-K>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

local M = {
	"neovim/nvim-lspconfig",
	commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
		},
	},
}

function M.config()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
	local function lsp_keymaps(bufnr)
		local keymap = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
		end
		keymap("gD", vim.lsp.buf.declaration, "Go to Declaration")
		keymap("gd", require("telescope.builtin").lsp_definitions, "Go to Definition")
		keymap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
		keymap("K", vim.lsp.buf.hover, "Hover")
		keymap("gI", require("telescope.builtin").lsp_implementations, "Implementation")
		keymap("gr", require("telescope.builtin").lsp_references, "References")
		keymap("gl", vim.diagnostic.open_float, "Diagnostic open float")
		keymap("<leader>ca", vim.lsp.buf.code_action, "Code action")
		keymap("<leader>lj", vim.diagnostic.goto_next, "Go to next diagnostic")
		keymap("<leader>lk", vim.diagnostic.goto_prev, "Go to prev diagnostic")
		keymap("<leader>lr", vim.lsp.buf.rename, "Lsp Rename")
		keymap("<leader>ls", vim.lsp.buf.signature_help, "Lsp Signature")
		keymap("<leader>lq", vim.diagnostic.setloclist, "Lsp Setloclist")
		-- shortcut
		keymap("<leader>li", "<cmd>LspInfo<cr>", "LspInfo")
		keymap("<leader>lm", "<cmd>Mason<cr>", "Mason")
	end

	local lspconfig = require("lspconfig")
	local on_attach = function(client, bufnr)
		lsp_keymaps(bufnr)
	end
	for _, server in pairs(require("lsp-server").servers) do
		Opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "settings." .. server)
		if require_ok then
			Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
		end

		lspconfig[server].setup(Opts)
	end
	lspconfig.emmet_ls.setup({
		-- on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"eruby",
			"html",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"svelte",
			"pug",
			"typescriptreact",
			"vue",
		},
		init_options = {
			html = {
				options = {
					-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
					["bem.enabled"] = true,
				},
			},
		},
	})

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = true,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			suffix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "single",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M

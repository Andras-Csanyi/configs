local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
end

local function keymap(mode, l, r, opts)
	opts = opts or {}
	opts.buffer = true
	opts.desc = string.format("Lsp: %s", opts.desc)
	vim.keymap.set(mode, l, r, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("DefaultLspAttach", { clear = true }),
	callback = function()
		keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
		keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition"})
		keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show info in hover window"})
		keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation"})
		keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Show references"})
		keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show info in hower window"})
		keymap("n", "<leader>rf", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", { desc = "Reformat file"})
		keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions"})
		keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({ buffer=0 })<CR>", { desc = "Next diagnostic issue"})
		keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({ buffer=0 })<CR>", { desc = "Previous diagnostic issue"})
		keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename"})
		keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature"})
		keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Fuck knows what is this"})
    keymap("n", "<leader>lh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end,
      { desc = "Toggle inlay hints."}
    )
	end,
})

return M

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				-- map("<leader>vtd", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>dS", require("telescope.builtin").lsp_workspace_symbols, "[W]orkspace [S]ymbols")

				-- Need to handle for one shot channel issue
				-- map("<leader>ws", function()
				-- 	require("telescope.builtin").lsp_dynamic_workspace_symbols()
				-- end, "[W]orkspace [S]ymbols")

				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("<leader>vd", vim.diagnostic.open_float, "[O]pen [D]iagnostic [F]loat")
				map("[d", vim.diagnostic.goto_next, "[G]oto [T]o [N]ext [D]iagnostics")
				map("]d", vim.diagnostic.goto_prev, "[G]oto [T]o [P]revious [D]iagnostics")
				map("[w", function()
					vim.diagnostic.goto_next({
						severity = vim.diagnostic.severity["WARN"],
					})
				end, "[G]oto [T]o [N]ext [W]arning")
				map("]w", function()
					vim.diagnostic.goto_prev({
						severity = vim.diagnostic.severity["WARN"],
					})
				end, "[G]oto [T]o [N]ext [W]arning")
				map("[e", function()
					vim.diagnostic.goto_next({
						severity = vim.diagnostic.severity["ERROR"],
					})
				end, "[G]oto [T]o [N]ext [E]rror")
				map("]e", function()
					vim.diagnostic.goto_prev({
						severity = vim.diagnostic.severity["ERROR"],
					})
				end, "[G]oto [T]o [N]ext [E]rror")
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end
				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local servers = {
			gopls = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			tsserver = {},
			elixirls = {},
			pylsp = {},
			jdtls = {},
			html = {},
			rust_analyzer = {},
			dockerls = {},
			docker_compose_language_service = {},
		}
		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
			"templ",
			"jsonls",
			"quick_lint_js",
			"golangci-lint",
			"vtsls",
			"biome",
			"emmet_ls",
			"emmet_language_server",
			"tailwindcss",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}

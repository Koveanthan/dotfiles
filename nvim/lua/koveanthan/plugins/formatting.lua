return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			return {
				async = false,
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt", "goimports", "goimports-reviser", "golines" },
			python = { "isort", "black" },
			rust = { "rustfmt" },
			typescript = { "prettierd" },
			javascript = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			scss = { "prettierd" },
			json = { "prettierd" },
		},
		config = function()
			require("conform").formatters.prettierd = {
				-- Use a specific prettier parser for a filetype
				-- Otherwise, prettier will try to infer the parser from the file name
				options = {
					-- javascript = "babel",
					-- javascriptreact = "babel",
					-- typescript = "typescript",
					-- typescriptreact = "typescript",
					-- vue = "vue",
					-- css = "css",
					-- scss = "scss",
					-- less = "less",
					-- html = "html",
					-- json = "json",
					-- jsonc = "json",
					-- yaml = "yaml",
					-- markdown = "markdown",
					-- ["markdown.mdx"] = "mdx",
					-- graphql = "graphql",
					-- handlebars = "glimmer",
				},
				-- Use a specific prettier parser for a file extension
				ext_parsers = {
					md = "markdown",
					js = "javascript",
					html = "html",
				},
			}
		end,
	},
}

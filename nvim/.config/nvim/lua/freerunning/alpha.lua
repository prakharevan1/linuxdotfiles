return {
	"goolord/alpha-nvim",
	--	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		vim.api.nvim_set_hl(0, "AlphaCustomHeader", { fg = "#7aa2f7", bold = true }) -- highlight

		dashboard.section.header.val = {
			[[                                                                                   ]],
			[[     /\__\         /\  \         /\  \         /\__\          ___        /\__\     ]],
			[[    /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |    ]],
			[[   /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |    ]],
			[[  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__  ]],
			[[ /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ]],
			[[ \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ]],
			[[     |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  /  ]],
			[[     |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /   ]],
			[[     /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /    ]],
			[[     \/__/         \/__/         \/__/                                   \/__/     ]],
			[[                                                                                   ]],
		}

		-- use our highlight group
		dashboard.section.header.opts.hl = "AlphaCustomHeader"
		dashboard.section.buttons.val = {
			dashboard.button("n", "  > new file", ":ene <BAR> startinsert <CR>"),
			-- dashboard.button( "f", "  > find projects" , ":<CR>"), I need to install yazi
			dashboard.button("r", "󰂺  > recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("u", "󰚰  > update plugins", ":Lazy update<CR>"),
			dashboard.button("s", "  > settings", ":e ~/.config/nvim<CR>"),
			dashboard.button("x", "󰈆  > exit", ":qa<CR>"),
		}

		--		local fortune = require("alpha.fortune")
		--		dashboard.section.footer.val = fortune
		--		disabled fortune

		local function footer()
			-- date time
			local datetime = os.date(" %B %d, %A  %I:%M %p")

			-- version info
			-- local version = vim.version()
			-- local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

			-- lazy.nvim plugin manager stats
			local stats = require("lazy").stats()
			local plugins_loaded = stats.loaded
			local plugins_total = stats.count

			local plugins_lazy = stats.loaded .. "/" .. stats.count

			return datetime .. " 󰒲 " .. plugins_lazy .. " plugins loaded"
		end
		dashboard.section.footer.val = footer()

		-- setup alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[
		autocmd FileType alpha setlocal nofoldenable
		]])
	end,
}

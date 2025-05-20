return {
	"goolord/alpha-nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local stats = require("lazy").stats()

		dashboard.section.header.val = {
			[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰱼  > Find file", ":cd /home/evan/Documents/programming | :Yazi<CR>"),
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  > Settings", ":cd $HOME/.config/nvim | :Yazi <CR>"),
			dashboard.button("q", "󰈆  > Quit NVIM", ":qa<CR>"),
		}

		local function footer()
			local ms = math.floor((stats.startuptime * 100 + 0.5) / 100)
			local plugins_loaded = stats.loaded
			local plugins_total = stats.count
			local datetime = os.date(" %d-%m-%Y   %I:%M %p")

			return datetime
				.. " 󱐌 "
				.. plugins_total
				.. " plugins configured ("
				.. plugins_loaded
				.. " loaded) in "
				.. ms
				.. " ms"
		end

		dashboard.section.header.opts.hl = "DashboardHeader"

		-- center strings

		local function get_max_width(...)
			local max_width = 0
			for _, str in ipairs({ ... }) do
				local str_width = vim.fn.strdisplaywidth(str)
				if str_width > max_width then
					max_width = str_width
				end
			end
			return max_width
		end

		-- Function to center a string
		local function center_string(str, width)
			local str_width = vim.fn.strdisplaywidth(str)
			if str_width >= width then
				return str
			end
			local total_padding = width - str_width
			local left_padding = math.floor(total_padding / 2)
			local right_padding = total_padding - left_padding
			return string.rep(" ", left_padding) .. str .. string.rep(" ", right_padding)
		end

		-- plugin load time needs to wait for lazy vim
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local max_width = get_max_width(footer(), random_quote)
				local centered_footer = center_string(footer(), max_width)
				--local centered_quote = center_string(random_quote, max_width)
				-- dashboard.section.footer.val = centered_footer .. "\n" .. require'alpha.fortune'()
				require("alpha.themes.dashboard").section.footer.val = require("alpha.fortune")()

				-- Text to append
				local extra = {
					"",
					"🚀 Ready to code!",
				}
				local headertable = {
					"",
					footer(),
				}

				-- Append lines to header
				for _, line in ipairs(extra) do
					table.insert(dashboard.section.header.val, line)
				end
				for _, line in ipairs(headertable) do
					table.insert(dashboard.section.header.val, line)
				end

				local function center(lines)
					local function pad_line(line)
						local total_width = 80 -- or choose your typical terminal width
						local line_width = vim.fn.strdisplaywidth(line)
						local pad = math.floor((total_width - line_width) / 2)
						return string.rep(" ", math.max(pad, 0)) .. line
					end

					local centered = {}
					for _, line in ipairs(lines) do
						table.insert(centered, pad_line(line))
					end
					return centered
				end
				dashboard.section.header.val = center(dashboard.section.header.val)

				vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#b7bdf8" }) -- Set custom header color
				alpha.redraw()
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
	end,
}

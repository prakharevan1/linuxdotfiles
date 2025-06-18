-- lazy.nvim
return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		dashboard = {
			-- your dashboard configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			preset = {
				header = [[
                                                                     
       ████ ██████           █████      ██            btw      
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                ]],
			},

			sections = {
				--				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = "cbonsai -liL 30",
					height = 30,
					padding = 0,
				},
				{

					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
		},

		terminal = {},
		animate = {},
		image = {},
		input = {},
		quickfile = {},
	},
}

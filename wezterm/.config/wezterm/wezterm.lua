local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- rendering
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 500
config.enable_kitty_graphics = true
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 500
config.cursor_blink_rate = 500
config.term = "xterm-256color"
-- Use config builder if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "catppuccin-macchiato"
config.enable_wayland = false -- hyprland support

config.font = wezterm.font_with_fallback({
	--{ family = "GohuFont 11 Nerd Font", scale = 1.15 },
	--	{ family = "DepartureMono Nerd Font Mono", scale = 1.0},
	--	{ family = "BigBlueTermPlus Nerd Font Propo", scale = 1.0},
	--	{ family = "FiraCode Nerd Font", scale = 1.0 },

	{ family = "Hack Nerd Font", scale = 1.0 },
})

-- victormono for italics specifically

-- auto fullscreen
local mux = wezterm.mux

config.font_rules = {
	{
		italic = true,
		font = wezterm.font("VictorMono Nerd Font", { italic = true, bold = true }),
	},
}
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.2,
	brightness = 1.1, --bright background, I need to read the text
}
wezterm.on("gui-startup", function(window)
	---@diagnostic disable-next-line: unused-local, undefined-global, redefined-local
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:maximize()
end)

config.window_background_opacity = 0.7
config.macos_window_background_blur = 100
config.window_decorations = "RESIZE"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.window_close_confirmation = "AlwaysPrompt"

-- Keys
config.leader = { key = "`", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	-- pane keybindings
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- custom mode to resize a pane
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
	-- new tab
	{ key = "T", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
	-- just in case of caps lock
	{ key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
	-- go back and forward tabs
	{ key = "b", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	-- opacity
	{
		key = "o",
		mods = "LEADER",
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.7
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
	{ key = "f", mods = "LEADER", action = wezterm.action.ToggleFullScreen },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
	},
}
-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)
for i = 1, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x003C) .. utf8.char(0x002F) .. utf8.char(0x003E) -- </> in Unicode
		ARROW_FOREGROUND = { Foreground = { Color = "#0da636" } }
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#000000" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
	-- dir
end)

config.initial_cols = 120
config.initial_rows = 33

-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 10000 -- or even 10000
config.hide_tab_bar_if_only_one_tab = true

return config

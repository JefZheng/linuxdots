local wezterm = require("wezterm")

return {
	--General--
	default_prog = { '/usr/bin/zsh', '-l' },
	window_close_confirmation = 'NeverPrompt',
	
	--Appearance--
	color_scheme = "Catppuccin Macchiato",
	adjust_window_size_when_changing_font_size = false,
	font = wezterm.font('MesloLGS NF'),
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = true,
	inactive_pane_hsb = {
    		saturation = 0.8,
    		brightness = 0.8,
  	},
  default_cursor_style = 'BlinkingBlock',
  cursor_blink_rate = 500,
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
	
	--Bindings--
	leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 1000 },

	
	keys = {
		--Copy and Paste
		{ key = "C", mods = "CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("PrimarySelection") },
		
		--Pane/Tab Management
		{ key = "t", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{
			key = "'",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "=", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "q", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
		{ key = "w", mods = "LEADER", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },

		--Navigation
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "a", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "d", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },

		{ key = "h", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 3 } }) },
		{ key = "j", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 3 } }) },
		{ key = "k", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 3 } }) },
		{ key = "l", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 3 } }) },
	},
	--Mouse Bindings
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = 'Left' } },
			mods = 'CTRL',
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	}
}

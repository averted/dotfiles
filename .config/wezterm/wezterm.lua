-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- maximize window on startup
wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

return {
  -- defaults
  default_prog = { '/bin/bash', '-l' },
  use_dead_keys = false,
  scrollback_lines = 10000,
  enable_scroll_bar = false,

  -- window
  window_decorations = 'RESIZE',
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = 5,
    right = 0,
    top = 5,
    bottom = 0,
  },

  -- scheme
  -- color_scheme = 'Railscasts (dark) (terminal.sexy)',
  color_scheme = 'Rippedcasts',

  -- font
  font = wezterm.font('Hack'),
  font_size = 16,
  line_height = 1,

  -- panes
  inactive_pane_hsb = {
    saturation = 0.5,
    brightness = 0.4
  },

  -- tabs
  hide_tab_bar_if_only_one_tab = false,
  window_frame = {
    font = wezterm.font { family = 'Hack', weight = 'Bold' },
  },

  -- keybinds
  -- disable_default_key_bindings = true,
  keys = {
    { key = '[', mods = 'CMD', action = act.ActivatePaneDirection 'Left', },
    { key = ']', mods = 'CMD', action = act.ActivatePaneDirection 'Right', },
    { key = 'f', mods = 'CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = 'x', mods = 'CMD', action = act.CloseCurrentPane { confirm = false } },
    { key = 'Enter', mods = 'CMD', action = act.ActivateCopyMode },
    { key = 'Enter', mods = 'LEADER', action = act.ActivateCopyMode },

    { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
    { key = '0', mods = 'CTRL', action = act.ResetFontSize },
    { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect { copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
    { key = 'b', mods = 'LEADER|CTRL', action = act.SendString '\x02', },
    -- { key = 'p', mods = 'LEADER', action = act.PastePrimarySelection, },
    { key = 'k', mods = 'CTRL|ALT', action = act.Multiple
      {
        act.ClearScrollback 'ScrollbackAndViewport',
        act.SendKey { key = 'L', mods = 'CTRL' }
      }
    },
    { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, }
  }
}

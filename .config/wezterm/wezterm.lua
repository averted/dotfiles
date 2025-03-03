-- local
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local copy_mode = nil
local c = wezterm.config_builder()

-- maximize window on startup
wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

-- defaults
c.default_prog = { '/bin/bash', '-l' }
c.use_dead_keys = false
c.scrollback_lines = 10000
c.enable_scroll_bar = false
c.freetype_load_flags = 'NO_HINTING'
c.audible_bell = 'Disabled'

-- window
c.window_decorations = 'RESIZE'
c.adjust_window_size_when_changing_font_size = false
c.window_padding = {
  top = 5,
  left = 5,
  right = 0,
  bottom = 0,
}

-- scheme
c.color_scheme = 'Violet Dark'
-- c.color_scheme = 'vimbones'

-- font
-- font = c.font = wezterm.font { family = 'Berkeley Mono Trial', weight = 'Medium' }
c.font = wezterm.font { family = 'Hack', weight = 'Regular' }
c.font_size = 16
c.line_height = 1
c.cell_width = 1

-- panes
c.inactive_pane_hsb = {
  saturation = 1,
  brightness = 0.2,
}

-- tabs
c.hide_tab_bar_if_only_one_tab = false
c.window_frame = {
  font = wezterm.font { family = 'Hack', weight = 'Bold' },
  font_size = 11,
}

-- keybinds
c.keys = {
  { key = '[', mods = 'CMD', action = act.ActivatePaneDirection 'Left', },
  { key = ']', mods = 'CMD', action = act.ActivatePaneDirection 'Right', },
  { key = 'f', mods = 'CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'x', mods = 'CMD', action = act.CloseCurrentPane { confirm = false } },
  { key = 'Enter', mods = 'CTRL', action = act.ActivateCopyMode },

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

-- re-map copy mode keys to match vim
if wezterm.gui then
  copy_mode = wezterm.gui.default_key_tables().copy_mode

  table.insert(
    copy_mode,
    { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveUp' }
  )

  table.insert(
    copy_mode,
    { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveDown' }
  )

  table.insert(
    copy_mode,
    { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveLeft' }
  )

  table.insert(
    copy_mode,
    { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveRight' }
  )
end

c.key_tables = {
  copy_mode = copy_mode
}

return c

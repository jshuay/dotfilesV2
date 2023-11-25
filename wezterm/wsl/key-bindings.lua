local wezterm = require("wezterm")
local action = wezterm.action

return {
    apply = function(config)
        --config.debug_key_events = true
        config.disable_default_key_bindings = true

        config.keys = {
            -- Clipboard
            { mods = "CTRL|SHIFT", key = "c", action = action.CopyTo("Clipboard") },
            { mods = "CTRL|SHIFT", key = "v", action = action.PasteFrom("Clipboard") },

            -- Zooming
            { mods = "CTRL", key = "-", action = action.DecreaseFontSize },
            { mods = "CTRL", key = "=", action = action.IncreaseFontSize },
            { mods = "CTRL", key = "0", action = action.ResetFontSize },

            -- Tabs
            {
                mods = "CTRL|SHIFT",
                key = "t",
                action = action.SpawnCommandInNewTab({ cwd = "~", domain = "CurrentPaneDomain" })
            },
            { mods = "CTRL|SHIFT", key = "w", action = action.CloseCurrentTab({ confirm = false }) },

            { mods = "CTRL|SHIFT", key = "{", action = action.ActivateTabRelative(-1) },
            { mods = "CTRL|SHIFT", key = "}", action = action.ActivateTabRelative(1) },

            { mods = "CTRL", key = "1", action = action.ActivateTab(0) },
            { mods = "CTRL", key = "2", action = action.ActivateTab(1) },
            { mods = "CTRL", key = "3", action = action.ActivateTab(2) },
            { mods = "CTRL", key = "4", action = action.ActivateTab(3) },
            { mods = "CTRL", key = "5", action = action.ActivateTab(4) },
            { mods = "CTRL", key = "6", action = action.ActivateTab(5) },
            { mods = "CTRL", key = "7", action = action.ActivateTab(6) },
            { mods = "CTRL", key = "8", action = action.ActivateTab(7) },
            { mods = "CTRL", key = "9", action = action.ActivateTab(-1) },

            -- Panes
            {
                mods = "CTRL",
                key = "UpArrow",
                action = action.SplitPane({ direction = "Up" })
            },
            {
                mods = "CTRL",
                key = "DownArrow",
                action = action.SplitPane({ direction = "Down" })
            },
            {
                mods = "CTRL",
                key = "LeftArrow",
                action = action.SplitPane({ direction = "Left" })
            },
            {
                mods = "CTRL",
                key = "RightArrow",
                action = action.SplitPane({ direction = "Right" })
            },

            { mods = "CTRL|SHIFT", key = "UpArrow", action = action.ActivatePaneDirection("Up") },
            { mods = "CTRL|SHIFT", key = "DownArrow", action = action.ActivatePaneDirection("Down") },
            { mods = "CTRL|SHIFT", key = "LeftArrow", action = action.ActivatePaneDirection("Left") },
            { mods = "CTRL|SHIFT", key = "RightArrow", action = action.ActivatePaneDirection("Right") },

            { mods = "CTRL|SHIFT|ALT", key = "UpArrow", action = action.AdjustPaneSize({ "Up", 1 }) },
            { mods = "CTRL|SHIFT|ALT", key = "DownArrow", action = action.AdjustPaneSize({ "Down", 1 }) },
            { mods = "CTRL|SHIFT|ALT", key = "LeftArrow", action = action.AdjustPaneSize({ "Left", 1 }) },
            { mods = "CTRL|SHIFT|ALT", key = "RightArrow", action = action.AdjustPaneSize({ "Right", 1 }) },

            { mods = "CTRL|SHIFT", key = "x", action = action.CloseCurrentPane({ confirm = false }) },

            { mods = "CTRL|SHIFT", key = "r", action = action.RotatePanes("CounterClockwise") },
            { mods = "CTRL|SHIFT|ALT", key = "r", action = action.RotatePanes("Clockwise") },

            { mods = "CTRL|SHIFT", key = "z", action = action.TogglePaneZoomState },

            -- Scrollback
            {
                mods = "CTRL|SHIFT", key = "k",
                action = action.Multiple({
                    action.ClearScrollback("ScrollbackAndViewport"),
                    action.SendKey({ mods = "CTRL", key = "l" })
                })
            },
            { mods = "SHIFT", key = "UpArrow", action = action.ScrollByPage(-0.5) },
            { mods = "SHIFT", key = "DownArrow", action = action.ScrollByPage(0.5) },

            -- Misc.
            { mods = "CTRL|SHIFT", key = "p", action = action.ActivateCommandPalette },
            { mods = "CTRL|SHIFT", key = "l", action = action.ShowDebugOverlay },
            { mods = "CTRL|SHIFT", key = "u", action = action.CharSelect({ group = "SmileysAndEmotion" }) },
            { mods = "CTRL|SHIFT", key = "f", action = action.Search({ CaseInSensitiveString = "" }) },
            { mods = "CTRL|SHIFT", key = "n", action = action.SpawnWindow },

            { mods = "CTRL", key = "z", action = action.Nop },

            { mods = "SHIFT|ALT", key = "LeftArrow", action = action.SendKey({ mods = "CTRL", key = "a" }) },
            { mods = "SHIFT|ALT", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
            { mods = "SHIFT|ALT", key = "Backspace", action = action.SendKey({ mods = "CTRL", key = "k" }) },
        }
        config.key_tables = {
            search_mode = {
                {
                    mods = "NONE",
                    key = "Escape",
                    action = action.Multiple({
                        action.CopyMode("ClearPattern"),
                        action.CopyMode("Close")
                    })
                },
                { mods = "CTRL|SHIFT", key = "f", action = action.CopyMode("ClearPattern") },
            }
        }
    end
}

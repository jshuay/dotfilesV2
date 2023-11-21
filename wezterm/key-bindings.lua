local action = require("wezterm").action

return {
    apply = function(config)
        config.keys = {
            { key = "v", mods = "CTRL", action = action.PasteFrom("Clipboard") }
        }
    end
}

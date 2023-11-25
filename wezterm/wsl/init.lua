local wezterm = require("wezterm")

return {
    apply = function(config)
        config.default_domain = "WSL:Ubuntu"

        require("wsl.key-bindings").apply(config)
    end
}

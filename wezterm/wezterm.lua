local config = {}

require("settings").apply(config)
require("appearance").apply(config)
require("wsl").apply(config)

return config

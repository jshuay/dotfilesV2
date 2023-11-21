local config = {}

config.default_domain = "{{wezterm_default_domain}}"

require("appearance").apply(config)
require("key-bindings").apply(config)

return config

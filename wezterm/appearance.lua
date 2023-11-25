local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local index = ""
    if #tabs > 1 then
        index = "[" .. (tab.tab_index + 1) .. "] "
    end

    local title = tab.tab_title
    if not title or #title == 0 then
        title = tab.active_pane.title
    end

    local zoomed = ""
    if tab.active_pane.is_zoomed then
        zoomed = "  󰼀"
    end


    return index .. title .. zoomed
end)

return {
    apply = function(config)
        config.color_scheme = "Sagelight (base16)"
        config.color_scheme = "Ocean (dark) (terminal.sexy)"
        config.color_scheme = "jmbi (terminal.sexy)"

        --config.use_fancy_tab_bar = false
        --config.hide_tab_bar_if_only_one_tab = true
        --config.tab_bar_at_bottom = true
        config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

        config.window_background_opacity = 0.95

        config.font_size = 14.0
    end
}

return {
    apply = function(config)
        config.window_close_confirmation = "NeverPrompt"
        config.audible_bell = "Disabled"
        config.force_reverse_video_cursor = true
        config.warn_about_missing_glyphs = false
        config.adjust_window_size_when_changing_font_size = false
        config.scrollback_lines = 10000

        config.skip_close_confirmation_for_processes_named = {
            "bash",
            "sh",
            "zsh",
            "fish",
            "tmux",
            "nu",
            "cmd.exe",
            "pwsh.exe",
            "powershell.exe",
            "wslhost.exe",
            "wsl.exe",
            "conhost.exe",
        }
    end
}

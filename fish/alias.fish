alias clear "clear_save_history"

if type -q eza
    alias ls "eza -loB --icons --smart-group --time-style '+%Y.%m.%d %H:%M'"
    alias lsa "ls -a"
end

if type -q peco
    alias peco "peco --on-cancel error --prompt '>' --layout bottom-up"
end

alias wp "cd ~/workplace/"

alias vi "nvim"

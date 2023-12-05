if type -q starship
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
end

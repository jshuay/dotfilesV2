set fish_greeting ""
set fish_autosuggestion_enabled 0

# Emit title for new tabs
# 2024-10-22: Disabling because this breaks scp
#printf "\033]1;%s \007" (fish_prompt_pwd_dir_length=1 prompt_pwd)

source ~/.config/fish/env_vars.fish
source ~/.config/fish/alias.fish
source ~/.config/fish/starship.fish

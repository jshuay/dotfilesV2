set fish_greeting ""

# Emit title for new tabs
printf "\033]1;%s" (fish_prompt_pwd_dir_length=1 prompt_pwd)

source ~/.config/fish/env_vars.fish
source ~/.config/fish/alias.fish
source ~/.config/fish/starship.fish

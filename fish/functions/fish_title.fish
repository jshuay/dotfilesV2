function fish_title
    if set -q argv[1]
        echo $argv
        return
    end
    echo (fish_prompt_pwd_dir_length=0 prompt_pwd)
end

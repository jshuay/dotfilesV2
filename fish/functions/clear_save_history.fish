function clear_save_history
    for i in (seq (math $LINES - 1))
        printf "\n"
    end
    tput cup 0
end

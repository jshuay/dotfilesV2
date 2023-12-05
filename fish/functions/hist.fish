function hist
    if type -q peco
        if history | peco | read result
            commandline $result
        end
    end
end

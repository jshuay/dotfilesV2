begin
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end &> /dev/null

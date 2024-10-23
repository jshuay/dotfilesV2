#!/bin/bash

read -p "Git email: " GIT_EMAIL
read -p "Git username: " GIT_USERNAME

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"

# To generate ssh key:
#ssh-keygen -t ed25519 -C "$GIT_EMAIL"

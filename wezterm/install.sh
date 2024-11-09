#!/bin/bash

read -p "Install path: " INSTALL_PATH

# Linux
# ln -s $PWD $INSTALL_PATH

# Windows
cp -r $PWD $INSTALL_PATH

echo "Installed at [$INSTALL_PATH]"

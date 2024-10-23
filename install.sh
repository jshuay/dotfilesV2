#!/bin/bash

FEAT="CONFIG_HOME"
CONFIG_HOME="$HOME/.config"
echo "[$FEAT] Creating [$CONFIG_HOME]"
if [ -d $CONFIG_HOME ]; then
    while true; do
        read -p "[$FEAT] Directory already exists. Overwrite? [y/N] " YN
	case $YN in
	    [Yy]* ) OVERWRITE=true; break;;
	    * ) SKIP=true; break;;
        esac
    done
fi
if [ "$SKIP" = true ]; then
    echo "[$FEAT] Skipped"
    unset SKIP
else
    if [ "$OVERWRITE" = true ]; then
        echo "[$FEAT] Overwriting"
        rm -fr $CONFIG_HOME
        unset OVERWRITE
    fi
    mkdir -p $CONFIG_HOME
    echo "[$FEAT] Installed"
fi

FEAT="GIT"
SOURCE="$PWD/git"
DEST="$CONFIG_HOME/git"
echo "[$FEAT] Installing [$SOURCE] to [$DEST]"
if [ -d $DEST ]; then
    while true; do
        read -p "[$FEAT] Directory already exists. Overwrite? [y/N] " YN
	case $YN in
	    [Yy]* ) OVERWRITE=true; break;;
	    * ) SKIP=true; break;;
        esac
    done
fi
if [ "$SKIP" = true ]; then
    echo "[$FEAT] Skipped"
    unset SKIP
else
    if [ "$OVERWRITE" = true ]; then
        echo "[$FEAT] Overwriting"
        rm -fr $DEST
        unset OVERWRITE
    fi
    ln -s $SOURCE $DEST
    $SOURCE/install.sh
    echo "[$FEAT] Installed"
fi

FEAT="FISH"
SOURCE="$PWD/fish"
DEST="$CONFIG_HOME/fish"
echo "[$FEAT] Installing [$SOURCE] to [$DEST]"
if [ -d $DEST ]; then
    while true; do
        read -p "[$FEAT] Directory already exists. Overwrite? [y/N] " YN
	case $YN in
	    [Yy]* ) OVERWRITE=true; break;;
	    * ) SKIP=true; break;;
        esac
    done
fi
if [ "$SKIP" = true ]; then
    echo "[$FEAT] Skipped"
    unset SKIP
else
    if [ "$OVERWRITE" = true ]; then
        echo "[$FEAT] Overwriting"
        rm -fr $DEST
        unset OVERWRITE
    fi
    ln -s $SOURCE $DEST
    $SOURCE/install.sh
    echo "[$FEAT] Installed"
fi

FEAT="STARSHIP"
SOURCE="$PWD/starship"
DEST="$CONFIG_HOME/starship"
echo "[$FEAT] Installing [$SOURCE] to [$DEST]"
if [ -d $DEST ]; then
    while true; do
        read -p "[$FEAT] Directory already exists. Overwrite? [y/N] " YN
	case $YN in
	    [Yy]* ) OVERWRITE=true; break;;
	    * ) SKIP=true; break;;
        esac
    done
fi
if [ "$SKIP" = true ]; then
    echo "[$FEAT] Skipped"
    unset SKIP
else
    if [ "$OVERWRITE" = true ]; then
        echo "[$FEAT] Overwriting"
        rm -fr $DEST
        unset OVERWRITE
    fi
    ln -s $SOURCE $DEST
    $SOURCE/install.sh
    echo "[$FEAT] Installed"
fi

FEAT="BIN"
SOURCE="$PWD/bin"
DEST="$HOME/bin"
echo "[$FEAT] Installing [$SOURCE] to [$DEST]"
if [ -d $DEST ]; then
    while true; do
        read -p "[$FEAT] Directory already exists. Overwrite? [y/N] " YN
	case $YN in
	    [Yy]* ) OVERWRITE=true; break;;
	    * ) SKIP=true; break;;
        esac
    done
fi
if [ "$SKIP" = true ]; then
    echo "[$FEAT] Skipped"
    unset SKIP
else
    if [ "$OVERWRITE" = true ]; then
        echo "[$FEAT] Overwriting"
        rm -fr $DEST
        unset OVERWRITE
    fi
    ln -s $SOURCE $DEST
    echo "[$FEAT] Installed"
fi

FEAT="NVIM"
SOURCE="$PWD/nvim"
DEST="$CONFIG_HOME/nvim"
echo "[$FEAT] Installing [$SOURCE] to [$DEST]"
if [ -d $DEST ]; then
    while true; do
        read -p "[$FEAT] Directory already exists. Overwrite? [y/N] " YN
	case $YN in
	    [Yy]* ) OVERWRITE=true; break;;
	    * ) SKIP=true; break;;
        esac
    done
fi
if [ "$SKIP" = true ]; then
    echo "[$FEAT] Skipped"
    unset SKIP
else
    if [ "$OVERWRITE" = true ]; then
        echo "[$FEAT] Overwriting"
        rm -fr $DEST
        unset OVERWRITE
    fi
    ln -s $SOURCE $DEST
    echo "[$FEAT] Installed"
fi

FEAT="RUSTFMT"
SOURCE="$PWD/rustfmt"
DEST="$CONFIG_HOME/rustfmt"
echo "[$FEAT] Installing [$SOURCE] to [$DEST]"
if [ -d $DEST ]; then
    while true; do
        read -p "[$FEAT] Directory already exists. Overwrite? [y/N] " YN
	case $YN in
	    [Yy]* ) OVERWRITE=true; break;;
	    * ) SKIP=true; break;;
        esac
    done
fi
if [ "$SKIP" = true ]; then
    echo "[$FEAT] Skipped"
    unset SKIP
else
    if [ "$OVERWRITE" = true ]; then
        echo "[$FEAT] Overwriting"
        rm -fr $DEST
        unset OVERWRITE
    fi
    ln -s $SOURCE $DEST
    echo "[$FEAT] Installed"
fi

echo "Install Complete"

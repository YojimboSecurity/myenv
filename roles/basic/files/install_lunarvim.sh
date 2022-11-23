#!/usr/bin/env bash
# Install Lunar Vim
cd /tmp/

if command -v lvim  &> /dev/null; then
    echo "Lvim already installed, nothing to do."
    exit 0
fi

if [ ! -d "$HOME/.cargo/bin" ]; then
    echo "cargo is not installed"
    exit 1
fi

source "$HOME/.cargo/env"

LV_BRANCH='release-1.2/neovim-0.8' 
curl -OL https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh
chmod +x install.sh
./install.sh -y
echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.bashrc
echo "alias vim=$($HOME/.local/bin/lvim)" >> $HOME/.bashrc

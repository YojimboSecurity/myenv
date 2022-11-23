#!/usr/bin/env bash
# This script installs the latest version of NeoVim

latest_nvim_version=$(curl -v --stderr - https://github.com/neovim/neovim/releases/tag/stable | grep -m 1 'content="NVIM' | awk '{ print $NF}')

if command -v nvim  &> /dev/null; then
    nvim_version=$(nvim --version | awk '{print $2; exit}' | cut -d"-" -f1)
    echo "NeoVim $nvim_version already installed"
    if [ "$latest_nvim_version" == "$nvim_version" ]; then
        echo "Latest version of NeoVim installed, nothing to do."
        exit 0
    fi
    echo "NeoVim is not at the latest version. $latest_nvim_version != $nvim_version"
fi

cd /tmp 
echo "Downloading NeoVim"
curl -OL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
echo "Installing NeoVim"
dpkg -i nvim-linux64.deb


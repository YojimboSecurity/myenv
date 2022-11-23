#!/usr/bin/env bash
# Install rust

if command -v cargo &> /dev/null; then
    echo "cargo already installed, nothing to do"
    exit 0
fi

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y


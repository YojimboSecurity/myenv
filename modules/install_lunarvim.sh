#!/usr/bin/env bash
# Install Lunar Vim.
# This is intended to be ran via a script.

check_installed(){
    if command -v lvim  &> /dev/null; then
        echo "Lvim already installed, nothing to do."
        exit 0
    fi
}

install_lvim(){
    source "$HOME/.cargo/env"
    LV_BRANCH='release-1.2/neovim-0.8' 
    curl -OL https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh
    chmod +x install.sh
    ./install.sh -y
    rm install.sh
}

bash_config(){
    if ! grep -q .local/bin "$HOME/.bashrc"; then
        echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.bashrc
    fi
    if ! grep -q bin/lvim "$HOME/.bashrc"; then
        echo "alias vim=$HOME/.local/bin/lvim" >> $HOME/.bashrc
    fi
}

lvim_config(){
    git clone https://github.com/YojimboSecurity/config.git /tmp/config
    /tmp/config/install lvim
    rm -rf /tmp/config/
}

main(){
    check_installed
    install_lvim
    bash_config
    lvim_config
}


main "$@"

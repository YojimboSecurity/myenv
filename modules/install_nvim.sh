#!/usr/bin/env bash
# Install Neo Vim

set -ue

if [ "$EUID" -ne 0 ]; then
    echo "must run as root!"
    exit 1
fi

installed_version(){
    nvim --version | awk '{print $2; exit}'
}

latest_version(){
    curl -s https://github.com/neovim/neovim/tags | grep -m1 neovim/releases/tag/v | awk '{print $5}'
}

check_installed(){
    # check if nvim is installed and which version
    if command -v nvim  &> /dev/null; then
        if [[ "$(latest_version)" == *"$(installed_version)"* ]]; then
            echo "Latest version of NeoVim installed, nothing to do."
            exit 0
        fi
    fi
}

check_depends(){
    # fix the daemon restart
    sed -i "s/#\$nrconf/\$nrconf/g" /etc/needrestart/needrestart.conf
    sed -i "s/'i';/'a';/g" /etc/needrestart/needrestart.conf
    apt-get -qq update
    if ! command -v curl &>/dev/null; then
        apt-get install -y curl
    fi
    if ! command -v git &>/dev/null; then
        apt-get install -y git
    fi
}

install_nvim(){
    echo "installing Neo Vim"
    curl -OLs https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
    dpkg -i nvim-linux64.deb
    rm nvim-linux64.deb
    apt-get install -y python3-neovim
}

nvim_plugins(){
    curl -fLo "$HOME"/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    nvim --headless +PlugInstall +qa
}

setup_env(){
    local users
    users="$(ls /home)"
    if [ $# -ne 0 ]; then
        users=("$@")
    fi

    # set up nvim init
    git clone https://github.com/YojimboSecurity/config.git /tmp/config

    for user in "${users[@]}"
    do
        su "$user" /tmp/config/install nvim
    done
    rm -rf /tmp/config

    # install plugins
    for user in "${users[@]}"
    do
        su "$user" ./modules/install_nvim_plug.sh
    done
}

main(){
    check_depends
    check_installed     
    install_nvim
    nvim_plugins
    setup_env "$@"

    # check that everything worked as expected
    if [[ "$(latest_version)" != *"$(installed_version)"* ]]; then
        echo "did not install latest version"
    fi
    echo "installed nvim $(installed_version)"

}

main "$@"

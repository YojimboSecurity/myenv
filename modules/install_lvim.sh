#!/usr/bin/env bash

# check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "must run as root!"
    exit 1
fi

check_depends(){
    # fix the daemon restart
    sed -i "s/#\$nrconf/\$nrconf/g" /etc/needrestart/needrestart.conf
    sed -i "s/'i';/'a';/g" /etc/needrestart/needrestart.conf
    apt-get -qq update
    if ! command -v curl &>/dev/null; then
        apt-get install -y curl
    fi
    if ! command -v nvim &>/dev/null; then
        ./modules/install_nvim.sh
    fi
    if [ ! -d "$HOME/.cargo/bin" ]; then
        ./modules/install_rust.sh
    fi
    if ! command -v pip3 &>/dev/null; then
        apt-get install -y python3-pip
    fi
}

main(){
    check_depends
    local users
    users="$(ls /home)"
    if [ $# -ne 0 ]; then
        users=("$@")
    fi
    for user in "${users[@]}"
    do
        echo "installing lvim for $user"
        su "$user" ./modules/install_lunarvim.sh
    done
    ./modules/install_lunarvim.sh
}

main "$@"

#!/usr/bin/env bash
# Set up bash the way I like it.

set -ue

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
    if command -v curl &>/dev/null; then
        apt-get install -y curl
    fi
}
check_omb(){
    if [ -d /usr/local/share/oh-my-bash ]; then
        echo "oh-my-bash is already installed"
        exit 0
    fi
}

install_omb(){
    echo "installing oh-my-bash"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended --prefix=/usr/local
    sed -i "s/OSH_THEME=\"font\"/OSH_THEME=\"agnoster\"/g" /usr/local/share/oh-my-bash/bashrc
}

cp_bashrc(){
    cp /usr/local/share/oh-my-bash/bashrc ~/.bashrc
    local users
    users="$(ls /home)"
    if [ $# -ne 0 ]; then
        users=("$@")
    fi
    for user in "${users[@]}"
    do
        echo "creating bashrc for $user"
        cp /usr/local/share/oh-my-bash/bashrc /home/"$user"/.bashrc
    done
}

main(){
    check_depends
    check_omb    
    install_omb
    cp_bashrc "$@"
}

main "$@"

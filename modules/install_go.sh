#!/bin/bash
# Install the provided version, or the latest version of Go

set -ue


if [ "$EUID" -ne 0 ]; then
    echo "must run as root!"
    exit 1
fi

get_latest(){
    curl -s https://go.dev/dl/ | grep -m 1 linux-amd64.tar.gz | cut -d"/" -f3 | cut -d'"' -f1
}

install_go(){
    local version="$1"
    curl -OLs https://go.dev/dl/"$version"
    rm -rf /usr/local/go && tar -C /usr/local -xzf "$version" 
    if grep -q go/bin ~/.bash_profile; then 
        echo "go already added to path"
        return
    fi
    echo "export PATH=$PATH:/usr/local/go/bin" >> "$HOME/.bash_profile"
}


main(){
    # get the version of go to install
    local version=$(get_latest) # should be something like this, go1.19.3.linux-amd64.tar.gz
    if [ $# -ne 0 ]; then
        version="$1"
    fi

    echo "installing go $version"
    install_go $version

    # test that it was installed
    export PATH=$PATH:/usr/local/go/bin
    if [ ! command -v go &>/dev/null ]; then
        echo "go not installed"
        exit 1 
    fi

    # test that the right version was installed
    local installed_version=$(go version | awk '{print $3}')
    if [[ "$version" != *"$installed_version"* ]]; then
        echo "something went wrong"
    fi

    rm $version
    echo "go installed"    
}

main "$@"

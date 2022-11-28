#!/usr/bin/env bash
# Installs nvim plug a plugin manager
# This is inteneded to be ran by another script and expects to have nvim 
# installed.

main(){
    curl -fLo "$HOME"/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    nvim --headless +PlugInstall +qa
}

main "$@"

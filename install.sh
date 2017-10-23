#!/bin/bash
source functions

function main {
    GetOSVersion
    if [ "$os_name" == "Ubuntu"]; then
        install_zsh_ubuntu
    elif [ "$os_name" == "CentOs"]; then
        install_zsh_centos
    fi
    echo "Start installing oh-my-zsh"
    sh -c "$(wget https://raw.githubusercontent.com/NguyenHoaiNam/oh-my-zsh/master/tools/install.sh  -O -)"
}
# Start
main

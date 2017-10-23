function _ensure_lsb_release {
    if [[ -x $(command -v lsb_release 2>/dev/null) ]]; then
        return
    fi

    if [[ -x $(command -v apt-get 2>/dev/null) ]]; then
        sudo apt-get install -y lsb-release
    elif [[ -x $(command -v zypper 2>/dev/null) ]]; then
        sudo zypper -n install lsb-release
    elif [[ -x $(command -v dnf 2>/dev/null) ]]; then
        sudo dnf install -y redhat-lsb-core
    elif [[ -x $(command -v yum 2>/dev/null) ]]; then
        # all rh patforms (fedora, centos, rhel) have this pkg
        sudo yum install -y redhat-lsb-core
    else
        echo "Unable to find or auto-install lsb_release"
    fi
}

function GetOSVersion {
    _ensure_lsb_release
    os_name=$(lsb_release -i -s)
    typeset -xr os_name
}

function install_zsh_ubuntu {
    sudo apt-get install zsh -y
}

function install_zsh_centos {
    sudo yum install zsh
}

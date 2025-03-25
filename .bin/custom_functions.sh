#!/usr/bin/env bash

fix_path() {
    LINUX_PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne 'print join(":", grep { !/\/mnt\/[a-z]/ } split(/:/));')
    export PATH=$LINUX_PATH
}

cargo-update() {
    echo "Updating all cargo packages"
    installed_crates=$(cargo install --list | grep -E '^[a-z0-9_-]+ v[0-9.]+:$' | awk '{print $1}')
    for crate in $installed_crates; do
        cargo install "$crate"
    done
}

update-all-packages() {
    sudo apt update && sudo apt upgrade -y
    brew update && brew upgrade
    cargo-update
}

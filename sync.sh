#!/usr/bin/env sh

set -u

MASTER="/Volumes/DATA/books/00.calibre/"
SLAVE="$HOME/Calibre Library/"

sync() {
    rsync -av --delete "$1" "$2"
}

swap() {
    OLD_MASTER="$MASTER"
    OLD_SLAVE="$SLAVE"

    MASTER="$OLD_SLAVE"
    SLAVE="$OLD_MASTER"
}

show_sync() {
    printf "Will mirror all the data, including removing files in source.\n"
    printf "Source:      %s\n" "$MASTER"
    printf "Destination: %s\n" "$SLAVE"
    printf "%s\n" "-"
}

show_prompt() {
    printf "%s" "$1"
    read -r areyousure


    if [ "$areyousure" = "y" ]; then
        return 0
    fi

    return 1
}

while true; do
    show_sync
    show_prompt "Are you sure? [y/N] "

    do_sync=$?

    if [ "$do_sync" -eq 0 ]; then
        sync "$MASTER" "$SLAVE"
        exit
    fi

    show_prompt "Swap direction? [y/N] "
    do_swap=$?

    if [ "$do_swap" -ne 0 ]; then
        printf "Ok, aborting...\n"
        exit
    fi

    swap
    printf "\n\n%s\n\n" "-"
done

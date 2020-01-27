#!/usr/bin/env sh

set -eu

sync() {
    rsync -av --delete "$1" "$2"
}

MASTER="/Volumes/DATA/books/00.calibre/"
SLAVE="$HOME/Calibre Library/"

printf "Will mirror all the data, including removing files in source.\n"
printf "Source:      %s\n" "$MASTER"
printf "Destination: %s\n" "$SLAVE"
printf "%s\n" "-"

printf "Are you sure? [y/N] "
read -r areyousure

if [ "$areyousure" = "y" ]; then
    sync "$MASTER" "$SLAVE"
else
    printf "Aborting...\n"
fi

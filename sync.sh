 #!/usr/bin/env sh

 set -eu

 sync() {
     rsync -av --delete "$1" "$2"
 }

 CALIBRE_SOURCE="$HOME/Calibre Library/"
 BACKUP_DESTINATION="/Volumes/DATA/books/00.calibre/"

 printf "Will mirror all the data, including removing files in source.\n"
 printf "Source:      %s\n" "$CALIBRE_SOURCE"
 printf "Destination: %s\n" "$BACKUP_DESTINATION"
 printf "%s\n" "-"

 printf "Are you sure? [y/N] "
 read -r areyousure

 if [ "$areyousure" = "y" ]; then
     sync "$CALIBRE_SOURCE" "$BACKUP_DESTINATION"
 else
     printf "Aborting...\n"
 fi 
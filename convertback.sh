#!/bin/bash
#case-insensitive
# shopt -s nocaseglob
# Convert Windows-style .URL files to *nix .desktop files
# MUST give folder as argument, converts all files in folder
[ -n "${1}" -a -d "${1}" ] && cd "${1}"
 for file in *.desktop
do
	URLLINE=$(grep -Ei URL= "$file")
	FILENAME=`echo $(basename "$file") | cut -d'.' -f1`
echo "[InternetShortcut]\n""$URLLINE" > "$FILENAME.desktop"
done

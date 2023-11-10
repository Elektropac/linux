#!/bin/bash

# Tjek om 'dialog' er installeret, og installér det hvis det mangler
if ! command -v dialog &> /dev/null; then
    echo "'dialog' er ikke installeret. Installerer 'dialog'..."
    sudo apt-get install dialog
fi

# Definér scripts og deres beskrivelser
declare -A scripts
scripts["script1.sh"]="Install software"
scripts["script2.sh"]="Setup"
scripts["exit"]="Exit"

# Opret dialog kommando
cmd=(dialog --separate-output --checklist "Vælg scripts at køre:" 22 76 16)

# Tilføj scripts til dialog kommando
options=()
for script in "${!scripts[@]}"; do
    options+=("$script" "${scripts[$script]}" off)
done

# Vis dialogen og gem output
valgte_scripts=()
if valgte_scripts=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty); then
    for script in $valgte_scripts; do
        echo "Kører $script..."
        ./$script
    done
else
    echo "Ingen scripts valgt."
fi

# Ryd op
clear

echo "Alle valgte scripts er kørt."

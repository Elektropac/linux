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
scripts["runthis.sh"]="Exit"

# Opret dialog kommando
cmd=(dialog --separate-output --checklist "What do you want to do:" 22 50 36)

# Tilføj beskrivelserne til dialog kommando
options=()
for script in "${!scripts[@]}"; do
    options+=("${scripts[$script]}" off)
done

# Vis dialogen og gem output
valgte_scripts=()
if valgte_scripts=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty); then
    for description in "${valgte_scripts[@]}"; do
        # Find filnavnet baseret på beskrivelsen
        for script in "${!scripts[@]}"; do
            if [ "${scripts[$script]}" == "$description" ]; then
                echo "Kører $script..."
                ./$script
            fi
        done
    done
else
    echo "Ingen scripts valgt."
fi

# Ryd op
clear

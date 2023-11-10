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

# Tilføj scripts til dialog kommando
options=()
for script in "${!scripts[@]}"; do
    options+=("$script" "${scripts[$script]}" off)
done

# Vis dialogen og gem output
valgte_scripts=()
if valgte_scripts=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty); then
    ordered_scripts=()
    for script in $valgte_scripts; do
        ordered_scripts+=($script)
    done

    # Define the order in which scripts should be run
    script_order=("script1.sh" "script2.sh" "runthis.sh")

    for script_to_run in "${script_order[@]}"; do
        if [[ "${ordered_scripts[@]}" =~ "$script_to_run" ]]; then
            echo "Kører $script_to_run..."
            ./$script_to_run
        fi
    done
else
    echo "Ingen scripts valgt."
fi

# Ryd op
clear

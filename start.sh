#!/bin/bash
test mere
# Tjek om 'dialog' er installeret, og installér det hvis det mangler
if ! command -v dialog &> /dev/null; then
    echo "'dialog' er ikke installeret. Installerer 'dialog'..."
    sudo apt-get install dialog
fi

# Definér scripts og deres beskrivelser
declare -A scripts
scripts["script1.sh"]="Install software"
scripts["script2.sh"]="Setup"
scripts["updatefiles.sh"]="Update menu"

# Opret dialog kommando
cmd=(dialog --separate-output --checklist "What do you want to do:" 22 50 36)

# Define the desired order for the scripts
desired_order=("script1.sh" "script2.sh" "updatefiles.sh")

# Sort the options array according to the desired order
options=()
for script_name in "${desired_order[@]}"; do
    script_description="${scripts[$script_name]}"
    options+=("$script_name" "$script_description" off)
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

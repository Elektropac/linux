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
scripts["updatefiles.sh"]="Update menu"

# Opret dialog kommando
cmd=(dialog --radiolist "Choose an action:" 0 0 0)

# Byg radiolisten med scripts og beskrivelser
options=()
for script_name in "${!scripts[@]}"; do
    script_description="${scripts[$script_name]}"
    options+=("$script_name" "$script_description" off)
done

# Vis dialogen og gem output
chosen_script=""
chosen_script=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
if [ $? -eq 0 ]; then
    echo "Kører $chosen_script..."
    ./$chosen_script
else
    echo "Ingen handling valgt."
fi

# Ryd op
clear

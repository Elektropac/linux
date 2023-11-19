#!/bin/bash

# Tjek om 'dialog' er installeret, og installér det hvis det mangler
if ! command -v dialog &> /dev/null; then
    echo "'dialog' er ikke installeret. Installerer 'dialog'..."
    sudo apt-get install dialog
fi

# Definér scripts og deres beskrivelser
declare -A scripts
scripts["install.sh"]="Install software"
scripts["setup.sh"]="Setup this machine"
scripts["updatefiles.sh"]="Update menu"
scripts["manage-user.sh"]="Add, change and delete user"

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

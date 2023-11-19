#!/bin/bash

# Viser en liste over almindelige brugere på systemet
clear
echo -e "START\n"

# Spørger hvad brugeren ønsker at gøre
echo "What do you like to do? :"
echo "1. Install software"
echo "2. Setup terminal"
echo "3. Manage user"
echo "4. Exit"
read -p "Enter choise (1-4): " ACTION

case $ACTION in
    1)
      ./installSoftware.sh
    ;;

    2)
    ;;

    3)
      ./manage-user.sh
    ;;

    4)

    ;;

    esac
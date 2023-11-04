#!/bin/bash

while true; do
    # Display a menu
    clear
    echo -e "Install Software.\n"
    echo -e "Select an option:"
    echo -e "1. . "
    echo -e "2. . "
    echo -e "3. . "
    echo -e "5"
    echo -e "6"
    echo -e "7"
    echo -e "8"
    echo -e "8"
    echo -e "9. Go Back\n"

    # Read the user's choice
    read -p "Enter your choice (1/2/3..): " choicea

    # Process the user's choice
    case $choicea in
        1)
            echo "Not ready yet"
            ;;
        2)
            echo "Not ready yet"
            ;;
        3)
            echo "Not ready yet"
            ;;
        4)
            echo "Not ready yet"
            ;;
        5)
            echo "Not ready yet"
            ;;
        6)
            echo "Not ready yet"
            ;;
        7)
            echo "Not ready yet"
            ;;
        8)
            # Reboot system
            echo "Not ready yet"
            ;;
        9)
            # Exit the script
            ./start.sh
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option (1/2/3)."
            ;;
    esac
done

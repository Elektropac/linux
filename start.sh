#!/bin/bash

while true; do
    # Display a menu
    echo "Hello Jesper"
    echo "Select an option:"
    echo "1. Change Hostname "
    echo "2. Reboot System"
    echo "3. Exit"

    # Read the user's choice
    read -p "Enter your choice (1/2/3): " choice

    # Process the user's choice
    case $choice in
        1)
            # Change hostname
            ./change-hostname.sh
            ;;
        2)
            # Reboot system
            sudo reboot
            ;;
        3)
            # Exit the script
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option (1/2/3)."
            ;;
    esac
done

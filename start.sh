#!/bin/bash

while true; do
    # Display a menu
    clear
    echo -e "Hello Again, nice to see you.\n"
    echo "Select an option:"
    echo "1. Change Hostname "
    echo "3"
    echo "4"
    echo "5"
    echo "6"
    echo "7"
    echo "8"
    
    
    echo -e "\n9. Reboot System"
    echo "10. Exit"

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

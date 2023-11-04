#!/bin/bash

while true; do
    # Display a menu
    clear
    echo -e "Hello Again, nice to see you.\n"
    echo "Select an option:"
    echo "1. Install software. "
    echo "2. Setup Machine. "
    echo "3. Linux terminal help. "
    echo "5"
    echo "6"
    echo "7"
    echo "8"
    
    
    echo -e "\n8. Reboot System"
    echo -e "9. Exit\n"

    # Read the user's choice
    read -p "Enter your choice (1/2/3..): " choice

    # Process the user's choice
    case $choice in
        1)
            ./installSoftware.sh
            # Change hostname
            #./change-hostname.sh
            ;;
        2)
            ./setupMachine.sh
            ;;
        3)
            echo "No ready yet"
            ;;
        4)
            echo "No ready yet"
            ;;
        5)
            echo "No ready yet"
            ;;
        6)
            echo "No ready yet"
            ;;
        7)
            echo "No ready yet"
            ;;
        8)
            # Reboot system
            sudo reboot
            ;;
        9)
            # Exit the script
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a valid option (1/2/3)."
            ;;
    esac
done
